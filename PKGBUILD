# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=crenv
pkgver=1.1.0
pkgrel=2
pkgdesc='Crystal version manager like rbenv'
arch=('x86_64')
url='https://github.com/crenv/crenv'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${url}/master/LICENSE"
        "${pkgname}.install")
sha256sums=('30d48de8861da67daeb0f9e65fdc3afdc06e3ee1901a2a4012e5ffa207e203ab'
            '0d6be1a1350cf674a3c6e8e43bd6137f1a9a0f04e8e656a83446d13358be003c'
            '0ce11b3d71b5344d80ae05bcef4116256e0f07b543c1ddb7fa3976f6b7e1703f')
noextract=("LICENSE")
install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/lib/${pkgname}/completions"
  install -m 644 ./completions/* "${pkgdir}/usr/lib/${pkgname}/completions/"

  mkdir -p "${pkgdir}/usr/lib/${pkgname}/libexec"
  install -m 755 ./libexec/* "${pkgdir}/usr/lib/${pkgname}/libexec/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/libexec/${pkgname}" "${pkgdir}/usr/bin/"
}
