# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=declutter-diff-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A diff viewer for reviewing AI-written code that hides comments, tests, imports, logging"
arch=('x86_64' 'aarch64')
url="https://github.com/NikolajMosbaek/declutter-diff"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/declutter-diff-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/declutter-diff-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('e208e20f5526223f54dedbda9871d838861cfa4cfc5dadbef388e3977419dbfd')
sha256sums_aarch64=('e806ba93aaed499d6c20af36a323f334f7e0759c66fbdb7e21cf4db57c638484')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="declutter-diff-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="declutter-diff-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "declutter" "${pkgdir}/usr/bin/declutter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
