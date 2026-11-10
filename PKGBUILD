# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>
pkgname=lacuna-webpki
pkgver=2.17.0
pkgrel=1
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="https://lacunasoftware.com"
license=('unknown')
depends=('xdg-utils' 'icu')
options=('!strip' '!emptydirs')
# Lacuna's server sends its current package whatever version the path names,
# and keeps no older ones: a new release changes the checksum below.
source_x86_64=("${pkgname}-${pkgver}.deb::https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('b228bf81bfb6e313bf767ab2331a281695d3dfab7c6003d8b4c3ea33ea6563339e72fae93134741c7c359b355836c9410c91303efc6f483d9c1a7d276944a054')

package(){
# Extract package data
tar xf data.tar.* -C "${pkgdir}"

# Remove duplicates provided by other packages
rm -rf "${pkgdir}/usr/lib64"

# The native messaging manifests of Chrome, Chromium and Edge, owned by the
# package (the vendor's postinst copies them by hand, which leaves them
# unowned)
install -Dm644 "${pkgdir}/opt/lacuna-webpki/manifest.json" \
  "${pkgdir}/etc/opt/chrome/native-messaging-hosts/com.lacunasoftware.webpki.json"
install -Dm644 "${pkgdir}/opt/lacuna-webpki/manifest.json" \
  "${pkgdir}/etc/chromium/native-messaging-hosts/com.lacunasoftware.webpki.json"
install -Dm644 "${pkgdir}/opt/lacuna-webpki/manifest-edge.json" \
  "${pkgdir}/etc/opt/edge/native-messaging-hosts/com.lacunasoftware.webpki.json"

# Fix permissions
find "${pkgdir}" -type d -exec chmod 755 {} +
find "${pkgdir}" -type f -exec chmod 644 {} +
chmod 755 "${pkgdir}/opt/lacuna-webpki/webpki"
}
