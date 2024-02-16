#Maintainer: Shakakibara <aryan.1843@disroot.org>

pkgname='codetantra-sea'
pkgver=3.0.3
pkgrel=2
pkgdesc='Platform for online teaching.'
arch=('x86_64')
url='https://www.codetantra.com'
depends=('alsa-lib' 'firejail' 'nss' 'at-spi2-atk' 'cups' 'gtk3')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/ct-code/sea/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb"
        "sea.sh")
sha256sums=('b1e9a8ca714c6f66b1c3784f6135afbb956874aa4a5fe59784ae4a8c0d67e72a'
            'c18de58a189eb3d3e581e2f61c2db911cc988369e2cdef3403c3ead2c8594abd')

package() {
      #extract
      tar -xvf 'data.tar.xz' -C "${pkgdir}"

      #add firejail to desktop file.
      sed -i 's/^Exec=.*/Exec=firejail --noprofile \/opt\/codetantra-sea\/codetantra-sea/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      #remove the other exec line
      sed -i '/exec/d' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      #Install the launch script
      install -Dm 755 sea.sh "${pkgdir}/usr/bin/sea"

      #fix naming
      mv "${pkgdir}/opt/CodeTantra SEA" "${pkgdir}/opt/${pkgname}"
}
