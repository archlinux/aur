# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nanocl"
pkgname="${_pkgname}-bin"
pkgver=0.16.3
pkgrel=1
pkgdesc="Distributed System that simplifies the management of containers and virtual machines"
arch=('x86_64')
url="https://next-hat.com/nanocl"
_url="https://github.com/next-hat/${_pkgname}"
license=('Apache-2.0 OR MIT')
makedepends=('gzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${_pkgsrc}/README.md"
        "${_pkgsrc}-LICENSE-APACHE::${_url}/raw/refs/tags/${_pkgsrc}/LICENSE-APACHE"
        "${_pkgsrc}-LICENSE-MIT::${_url}/raw/refs/tags/${_pkgsrc}/LICENSE-MIT")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/${_pkgsrc}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums=('7d7267cef8e76aa388bc75509a852ec65285d2cc5832add24e0f0a49c03c440f'
            'eb641414f479cd1268f880aecba2ef4e539ef7013a262d474a08d3197f385440'
            '3fba92360d6a716c68c72f0a0a0c696642170b324c4777663e18edf9c8b6aa6e')
sha256sums_x86_64=('cc61a6bc970d8871e3e8a9e51c5eaa55f08a00f8c39dc0e664176b85678fd39a')

prepare() {
  cd "${srcdir}"
  find "share" -type f -exec \
    gzip -fd "{}" \;
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"

  find "bin"   -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
