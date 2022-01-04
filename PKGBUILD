# Maintainer: Bart Libert <aur at bart dot libert dot email>

pkgname=tabsearchproviderconnector
pkgver=0.1.0
pkgrel=2
pkgdesc="Browser tab search provider for GNOME"
url="https://github.com/harshadgavali/searchprovider-for-browser-tabs"
depends=('gnome-shell')
makedepends=('meson' 'rust')
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/harshadgavali/searchprovider-for-browser-tabs/archive/refs/tags/connector-v$pkgver.tar.gz")
sha256sums=('8d759df2e9b0c2e62a7fd799321d41426af861e15dcaa8037edfcbeaf0072bc5')
optdepends=('firefox: search firefox tabs from gnome shell'
            'chromium: search chromium tabs from gnome shell')

build() {
    sed -i 's@lib64/mozilla/native-messaging-hosts@lib/mozilla/native-messaging-hosts@' $srcdir/searchprovider-for-browser-tabs-connector-v$pkgver/connector/manifests/firefox/meson.build $srcdir/searchprovider-for-browser-tabs-connector-v$pkgver/connector/build-aux/tabsearchproviderconnector.spec
    arch-meson $srcdir/searchprovider-for-browser-tabs-connector-v$pkgver/connector build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 $srcdir/searchprovider-for-browser-tabs-connector-v$pkgver/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
