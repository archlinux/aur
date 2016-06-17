# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Kevin Hanselman <kevin.hanselman@gmail.com>
pkgname=xfce4-genmon-plugin-git
pkgver=r317.1c5524c
pkgrel=1
pkgdesc="plugin that monitors customizable programs stdout for the Xfce4 panel"
arch=('any')
url=""
license=('LGPL2')
groups=()
depends=()
makedepends=('git' 'xfce4-dev-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+git://git.xfce.org/panel-plugins/xfce4-genmon-plugin')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}" || exit
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit
    make DESTDIR="$pkgdir/" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
