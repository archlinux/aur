# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cmd-wrapped"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="Find out what the past year looks like in command line!"
arch=('x86_64' 'aarch64')
url="https://github.com/YiNNx/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/${pkgver}/README.md"
        "${url}/raw/${pkgver}/License")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-linux-x86_64.zip")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-linux-arm64.zip")
sha256sums=('c1fdd5cc04674b5ebaea52291ff7e3953c769218cbfefb9b5195a17683925414'
            'c0cfd6762582618b55f4ed97f737276b547dc2d2825e631df3db1e27fe591949')
sha256sums_x86_64=('edf85fc05b545df04c1735c9dae063a132d7a1f6d5f6eeee0bdcfd6fb4213a4e')
sha256sums_aarch64=('ea873578cf1a799d76bab42fdb8ed700381b333fbf72cf184cc75fbc01d8664f')

case "${CARCH}" in
  x86_64)
    _arch="x86_64"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "License" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-linux-${_arch}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
