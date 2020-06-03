# Maintainer: Ruben
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=dnieremote-bin
pkgver=1.0
pkgrel=0
pkgdesc="DNIeRemote enable to use the smartphone as reader for Spanish DNI"
arch=('x86_64')
url="https://www.dnielectronico.es/"
license=('custom')
depends=('gtkmm3' 'libpkcs11-dnie')
source=("https://www.dnielectronico.es/descargas/Apps/DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb"
        "https://www.dnielectronico.es/PDFs/DNIeRemote_user_manual.pdf")
noextract=("DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('e9540741fdc1def06bcf82a463f1241c66eb0e44e00815d6ec3c913617827d10'
            'c236326ba5bb2354e2a62b1be38e673f8a0a392423de354e8663c9069145022d')

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
