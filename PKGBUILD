# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=dial-a-pirate
pkgver=0.0.1
_commit="a5728ea"
pkgrel=1
pkgdesc="A LÖVE implementation of Dial-A-Pirate from the EGA version of The Secret of Monkey Island"
arch=('any')
url="https://gitlab.com/tallero/dial-a-pirate"
license=('AGPL3')
depends=('love')
makedepends=('git' 'wget')
options=(!strip)
source=("${pkgname}::git+$url#commit=${_commit}"
        "${pkgname}.sh")
sha512sums=(SKIP
            "18ed8c35ae97402b0b5b10630f7e9a477015200a6447fd6a45cab7e580d781381beb2b1c6bb8e2c893ddb6b0142ecec58b24831e75a0501f8ab3e3f5132b6e45")

build() {
  cd "${scrdir}/${pkgname}/assets"
  ./download-assets.sh
  cd ..
  ./build.sh
}

package() {
  cd "${scrdir}/${pkgname}"
  install -D -m0644 "${pkgname}.love" "${pkgdir}/usr/share/${pkgname}/${pkgname}.love"
  install -D -m0755 "${scrdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
