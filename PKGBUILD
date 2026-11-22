# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdfold-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A book reader that lays long text out as facing pages, with notes, vertical Japanese"
arch=('x86_64' 'aarch64')
url="https://github.com/azihsoyn/herdfold"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/herdfold-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/herdfold-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('cd0d1e115167179753831d8a2ef1208a3d3d44d75dfa501b7a2a9fe6fcd0f16e')
sha256sums_aarch64=('42e09829781085baabb33509ca74de3f6ac6fcfbf951194be11178a47e158522')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="herdfold-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="herdfold-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "herdfold" "${pkgdir}/usr/bin/herdfold"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
