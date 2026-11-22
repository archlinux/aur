# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rootle-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="A modal TUI for browsing GitHub and other source-control services with column views"
arch=('x86_64' 'aarch64')
url="https://github.com/rootledev/rootle"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rootledev/rootle/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rootle-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rootle-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('bb23cea06c1a4f205b5f6e2d4ecc5ff1c1ebf15829706f1fe366424d0919e9be')
sha256sums_x86_64=('9b4f340e4d93629a7341f180221a24760c1e2e6ef776959adaa61e413b2360ca')
sha256sums_aarch64=('4a92afada2cbffc17bf0073dc600e32cda0f67085edc1a9c83aa73f898a23da3')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rootle-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="rootle-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  cd "$_dir"
  install -Dm755 "rootle" "${pkgdir}/usr/bin/rootle"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
