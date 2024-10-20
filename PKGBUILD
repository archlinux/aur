# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="funzzy"
pkgname="${_pkgname}-bin"
pkgver=1.4.1
pkgrel=1
pkgdesc="A lightweight generic purpose file watcher"
arch=('x86_64')
url="https://github.com/cristianoliveira/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.tar.gz")
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('aeb499fecbbffb85e7a123fc439536d74a59f1d8efbf4305b563adc2b24a42d8'
            '06d192e34ed1d62acb191604c71067f6b40bda375e44f92b953bdb0ad7c524db')
sha256sums_x86_64=('365141ccd5c40e2a590802fc3f58737a7076a7733bd9aefde60273cd57b42dbc')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  mv -f "README-${pkgver}.md" "${_pkgsrc}-${CARCH}/README.md"
  mv -f "LICENSE-${pkgver}"   "${_pkgsrc}-${CARCH}/LICENSE"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${pkgdir}/usr/bin"
  ln -s "${_pkgname}" "fzz"
}
