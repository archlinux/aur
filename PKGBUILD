#Maintainer: Shakakibara <aryan.1843@disroot.org>

pkgname='codetantra-sea'
pkgver=3.1.0
pkgrel=2
pkgdesc='Platform for online teaching.'
arch=('x86_64')
url='https://www.codetantra.com'
depends=('alsa-lib' 'nss' 'at-spi2-atk' 'cups' 'gtk3')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/ct-code/sea/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb"
        "sea.sh")
sha256sums=('4c9f7d3fcffc8bad121e44c5480cd8eed028115e1b2992ffa08565fefce0a6bc'
            '1b1da4bc2ba74572ca909bf48fd635e0113ca410a678210c0b2ce59b61267810')

package() {
      #extract
      tar -xvf 'data.tar.xz' -C "${pkgdir}"

      #add firejail to desktop file.
      sed -i 's/^Exec=.*/Exec=\/opt\/codetantra-sea\/codetantra-sea --ignore-certificate-errors/'  "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      #remove the other exec line
      sed -i '/exec/d' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      #Install the launch script
      install -Dm 755 sea.sh "${pkgdir}/usr/bin/sea"

      #fix naming
      mv "${pkgdir}/opt/CodeTantra SEA" "${pkgdir}/opt/${pkgname}"
}
