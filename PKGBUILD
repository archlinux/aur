# Maintainer: Chris Kobayashi <software+aur@disavowed.jp>

pkgname="xfce4-hotcorner-plugin"
pkgver=0.0.3
pkgrel=1
pkgdesc="Allow users to set AfterDark-like hot corner actions"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://github.com/christopherkobayashi/xfce4-hotcorner-plugin"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck3')
makedepends=('cmake' 'xfce4-dev-tools' 'git')
source=("https://github.com/christopherkobayashi/xfce4-hotcorner-plugin/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('73ce19fc3c95d5ffba4d72601bebbd8723aaf5e974651c37d32281dcbad93a6ac2ee4e5bbfabf52dcd3f2459b464a1a8d740725784b917d4d1b51891dfde3ab4')

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
