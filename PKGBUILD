# Maintainer: Chris Kobayashi <software+aur@disavowed.jp>

pkgname="xfce4-hotcorner-plugin"
pkgver=0.0.4
pkgrel=1
pkgdesc="Allow users to set AfterDark-like hot corner actions"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://github.com/christopherkobayashi/xfce4-hotcorner-plugin"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck3' 'libnotify' 'gtk3' )
makedepends=('xfce4-dev-tools')
source=("https://github.com/christopherkobayashi/xfce4-hotcorner-plugin/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('e50eb010f8cbc470db15a402513e1c6b5c4e66decc1d8e2e6fbada2530542d0f6750d3989ee93818fa3122b373a2447e40706a6febc33bea61c91ce40bcba7d7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr && make
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
