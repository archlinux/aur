# Maintainer: FrogSnot
_pkgauthor=FrogSnot
_pkgname=HardBore
pkgname=hardbore-bin
pkgver=1.0.3
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
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed' 'd5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed' '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5' 'd5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed' 'd5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed' '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

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
