# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name=("protoc-gen-grpc-gateway" "protoc-gen-openapiv2")
_pkgname="grpc-gateway"
pkgname="${_pkgname}-bin"
pkgver=2.27.2
pkgrel=1
pkgdesc="gRPC to JSON proxy generator following the gRPC HTTP spec"
arch=('aarch64' 'x86_64')
url="https://grpc-ecosystem.github.io/grpc-gateway/"
_url="https://github.com/grpc-ecosystem/${_pkgname}"
license=('BSD-3-Clause')
depends=('protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc')
provides=("${_pkgname}" "${_name[@]}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
for _binary in "${_name[@]}"; do
    source_aarch64+=("${_binary}-${pkgver}-aarch64::${_url}/releases/download/v${pkgver}/${_binary}-v${pkgver}-linux-arm64")
    source_x86_64+=("${_binary}-${pkgver}-x86_64::${_url}/releases/download/v${pkgver}/${_binary}-v${pkgver}-linux-x86_64")
done
sha256sums=('a4764320cdc5246fa64626129b6bc8b6835a9c1fbb994daadbbd1268d5b949c1'
            'a15b1d1b168954c92ff7fb1620382418f7c72f4f4d251ee791d1098ad68ab0c4')
sha256sums_aarch64=('710bf0ac9d8cbe1d0e1ead29916cf50e08fa0976c6be5366c300e8044d8e67b8'
                    'efce95ad086b0ffada3b2db0fac833ee444b9d658cd652f6041d1f2af30800cc')
sha256sums_x86_64=('46a51c05403b2392cec1e554a295726f00731b11eddffd22406bffbc74afe885'
                   '957ab86000557c748ff79f26ea6578dc91a0264e76c57f07b9c932b1f9776e57')

package() {
  cd "${srcdir}"
  for _binary in "${_name[@]}"; do
    install -vDm755 "${_binary}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_binary}"
  done

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
