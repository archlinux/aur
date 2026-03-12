# Maintainer: FrogSnot
_pkgauthor=FrogSnot
_pkgname=HardBore
pkgname=hardbore-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="High-performance file manager for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'glib2' 'webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo'
         'libayatana-appindicator' 'librsvg' 'libsoup3' 'hicolor-icon-theme' 'sqlite' 'dbus')
provides=('hardbore')
conflicts=('hardbore')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/README.md"
        "portal-$pkgver::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/portal"
        "hardbore.portal-$pkgver::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/portal/hardbore.portal"
        "hardbore.service-$pkgver::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/portal/org.freedesktop.impl.portal.desktop.hardbore.service"
        "${pkgname%-bin}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('c4215762b499abb4cf9674a5653c08691bbed2fbcad74441971069d0364485fe' '4cc02bbabe987a4eef2c4f670da1d551c20bca714357c02b05d831ccdd1f8090' 'd2bdbb9537f1cc4d0f7b736c84e3cf08c93887d87f2acd04c0fd77381a80bdac' '59b5a84ebacb0ee0d30244106d78b7e7114b7a1034f03d5f714c43d151ae15a3' 'd88556c4fb6bbf3d12e87916526759c664377ce9268e004cf111dfcd311fba81' 'bde38d035d352dcad9fc8c0baac7a9cb135f514c46eb0a1b1dc1b9ec675fab9a')

package() {
    cd "$srcdir"

    tar -xzf data.tar.gz -C "$pkgdir"

    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"

    install -Dm755 "portal-$pkgver" "$pkgdir/usr/local/bin/hardbore-portal"
    install -Dm644 "hardbore.portal-$pkgver" "$pkgdir/usr/share/xdg-desktop-portal/portals/hardbore.portal"
    install -Dm644 "hardbore.service-$pkgver" \
        "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.hardbore.service"
}
