_pkgname='codetantra-sea'
pkgname="${_pkgname}-bin"
pkgver=3.0.2
pkgrel=2
pkgdesc='Platform for online teaching.'
arch=('x86_64')
url='https://www.codetantra.com'
depends=('alsa-lib' 'firejail' 'nss' 'at-spi2-atk' 'cups' 'gtk3')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/ct-code/sea/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "sea.sh")
sha256sums=('7334f689c12391781c27dae2e6fef7a0f9ec91be9bfe23e6161cd491eb2af743'
            'c18de58a189eb3d3e581e2f61c2db911cc988369e2cdef3403c3ead2c8594abd')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  sed -i 's/^Exec=.*/Exec=firejail --noprofile \/opt\/codetantra-sea\/codetantra-sea/' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i '/exec/d' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm 755 sea.sh "${pkgdir}/usr/bin/sea"

  mv "${pkgdir}/opt/CodeTantra SEA" "${pkgdir}/opt/${_pkgname}"
}
