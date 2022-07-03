# Maintainer: budRich <of budlabs>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Kevin Hanselman <kevin.hanselman@gmail.com>
pkgname=xfce4-genmon-plugin-git
pkgver=r834.164b4a3
pkgrel=1
pkgdesc="plugin that monitors customizable programs stdout for the Xfce4 panel"
arch=('x86_64')
license=('LGPL2')
makedepends=('git' 'xfce4-dev-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('xfce4-panel')
source=('git+https://gitlab.xfce.org/panel-plugins/xfce4-genmon-plugin.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}" 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}" 
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname%-git}" 
    make DESTDIR="$pkgdir/" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
