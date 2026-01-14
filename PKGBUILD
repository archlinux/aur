# Maintainer: Shakakibara <aryan.1843@disroot.org>

pkgname='codetantra-sea'
pkgver=4.3.0
pkgrel=2
pkgdesc='Platform for online teaching.'
arch=('x86_64')
url='https://www.codetantra.com'
license=('custom')
depends=('alsa-lib' 'nss' 'at-spi2-atk' 'gtk3')
options=('!strip')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/ct-code/sea/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb"
        "sea.sh")
sha256sums=('1b8a56bb7bf740f58f9277dd84acb59010790ed64a22fab64fd8eff28f6d0b27'
            '1b1da4bc2ba74572ca909bf48fd635e0113ca410a678210c0b2ce59b61267810')

package() {
      # Extract
      bsdtar -xf data.tar.xz -C "$pkgdir/"

      # Add flag for qol, because codetantra doesn't handle ssl errors properly.
      sed -i 's/^Exec=.*/Exec=\/opt\/codetantra-sea\/codetantra-sea --ignore-certificate-errors/'  "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      # Install the launch script
      install -Dm 755 sea.sh "${pkgdir}/usr/bin/sea"

      # Fix naming
      mv "${pkgdir}/opt/CodeTantra SEA" "${pkgdir}/opt/${pkgname}"
}
