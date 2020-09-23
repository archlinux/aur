# Maintainer: Ruben
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=dnieremote-bin
pkgver=1.0
pkgrel=2
pkgdesc="DNIeRemote enable to use the smartphone as reader for Spanish DNI"
arch=('x86_64')
url="https://www.dnielectronico.es/"
license=('custom')
depends=('gtkmm3' 'libpkcs11-dnie')
source=("https://www.dnielectronico.es/descargas/Apps/DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb"
        "https://www.dnielectronico.es/PDFs/DNIeRemote_user_manual.pdf")
noextract=("DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('b8fdcfe57350dc45e75f876e962aff7c6b31d124ee5ac63b62260874e53ef07b'
            'afb1520fc5d3329d5ef271d89b6c7026d9208b79c52de0d491eaf543d642f9d0')

# Misconfigured server
DLAGENTS=('https::/usr/bin/curl -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')

package() {
  bsdtar -O -xf "DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Fix permissions
  find "${pkgdir}" -type f -exec chmod 644 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod 755 "${pkgdir}/usr/bin/dnieremotewizard"

  # Install manual
  install -D -m644 "DNIeRemote_user_manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/README.pdf"
}
