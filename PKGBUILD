# Maintainer: Chris Kobayashi <software+aur@disavowed.jp>

pkgname="xfce4-hotcorner-plugin"
pkgver=0.0.3a
pkgrel=1
pkgdesc="Allow users to set AfterDark-like hot corner actions"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://github.com/christopherkobayashi/xfce4-hotcorner-plugin"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck3')
makedepends=('cmake' 'xfce4-dev-tools' 'git')
source=("https://github.com/christopherkobayashi/xfce4-hotcorner-plugin/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('1269dca0a08e700b5c3e070e8d18fdf516c7c2f77df8e3acafd95547de8c2d312a7c5e3a6962a5c0bc5cb76abe14a073b644fb4a3979532156181fe62c4b3ebb')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

post_install() {
    # we use a stock icon, this isn't necessary?
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

post_upgrade() {
    post_install
}

post_remove() {
    post_install
}
