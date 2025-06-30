# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name=("protoc-gen-grpc-gateway" "protoc-gen-openapiv2")
_pkgname="grpc-gateway"
pkgname="${_pkgname}-bin"
pkgver=2.27.1
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
sha256sums_aarch64=('837e835946219837064ce691c007d045d10977ea3a4ea70b0ea5e2ead196bcda'
                    '3510db1ea197d4ff9456cdac90ecfdbadd018858d6d73b9e5031257474aac284')
sha256sums_x86_64=('74b7f8711097d544de49f4db0894941f8952139b5e75106365f3af1c47696649'
                   'd163c53e0f1506c109ed4452f6cedf2440af6ff15d621be34144da7e996e2327')

package() {
  cd "${srcdir}"
  for _binary in "${_name[@]}"; do
    install -vDm755 "${_binary}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_binary}"
  done

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
