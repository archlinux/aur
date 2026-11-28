# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=etcd-defrag-bin
pkgver=0.48.0
pkgrel=1
pkgdesc="Smarter etcd defragmentation tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ahrtr/etcd-defrag"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ahrtr/etcd-defrag/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/etcd-defrag-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/etcd-defrag-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('58cb51bbe8ddf9ad37ab00a5cbb7bbb3d06c7155cca0229056c673083b74f43e')
sha256sums_x86_64=('883d2406283754977e221008a440b72058ab3e38725fb09e627098a0cb1d6b67')
sha256sums_aarch64=('24100ad0fd111ed826407e6ae9999a9954ee3f5167c33f91a2861b8c4ef1e20b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="etcd-defrag-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="etcd-defrag-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/etcd-defrag" "${pkgdir}/usr/bin/etcd-defrag"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
