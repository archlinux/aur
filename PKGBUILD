# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name=("protoc-gen-grpc-gateway" "protoc-gen-openapiv2")
_pkgname="grpc-gateway"
pkgname="${_pkgname}-bin"
pkgver=2.26.3
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
sha256sums=('34032a76bdc92ab2b2c22e68cd2c57a434d8f2355cc285f2675eeb9d754d037c'
            'a15b1d1b168954c92ff7fb1620382418f7c72f4f4d251ee791d1098ad68ab0c4')
sha256sums_aarch64=('c07ecc2f0ea723b1a8e92281c3d3f37289ee0fc29fbd2219f3fdf7f974233e94'
                    '488e64eb06165545e213efc1fd9e06196dc88c9e2344c4b2b0d8e7a09538bd6a')
sha256sums_x86_64=('f7698dfa878b83d6a6387d03984afa419bed4b0c1439f1092db89034cd708318'
                   'a4eec19cfced95a71994c000f68b72038fba381a08266f0e9bb1931165a8aede')

package() {
  cd "${srcdir}"
  for _binary in "${_name[@]}"; do
    install -vDm755 "${_binary}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_binary}"
  done

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
