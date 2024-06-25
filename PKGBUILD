# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=algolia
pkgname=${_pkgname}-bin
pkgver=1.6.11
pkgrel=1
pkgdesc="Interact with and configure Algolia applications"
arch=('x86_64' 'i686' 'aarch64' 'armv6h')
url="https://github.com/${_pkgname}/cli"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/raw/v${pkgver}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums=('d74bc42be4cbafb48fd96d7cbd7759b14ecbfec843de1755b1ed1f0dd55d4c5a')
sha256sums_x86_64=('ef892f73cf0574501ab02f091843c77c09a41ab33e8a5278b21d5b74723e3a2b')
sha256sums_i686=('55138fa98d45decba19f0218ee13739b6fd01a24b5d54f828fd53a66bc88cac9')
sha256sums_aarch64=('a161e1f066cbdb5348228b6e5cad052c4c7da9217f390a1e73e60653d408599c')
sha256sums_armv6h=('4f6f133d284c2b442e9ea8e918eb0cbfdf5bd85e907cadc736ef0306311b3cd1')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  i686)
    _arch="i386"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  armv6h)
    _arch="armv6"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${_pkgname}_${pkgver}_linux_${_arch}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
