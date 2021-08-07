# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gpg-tui-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="A terminal user interface for GnuPG"
arch=('x86_64')
url="https://github.com/orhun/gpg-tui"
license=('MIT')
depends=('libxcb' 'gpgme')
optdepends=(
  'xplr: for file selection support'
  'xclip: for clipboard support on X11 (or xsel)'
  'xsel: for clipboard support on X11 (or xclip)'
  'wl-clipboard: for clipboard support on Wayland'
)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.sig})
sha512sums_x86_64=('9bf1c448307e7ad0c2dffbe2e9b6978124bac14f3f27d113fe4c2020fc47a9bf80d90bb0f395b31613f97d5df07a2f50d389d5b2970c2d3e53f47ad73c43cb7d'
                   'SKIP')
validpgpkeys=('14D49A4073C6899425D5315C1BC755D9FBD24068') # gpg-tui <gpg-tui@protonmail.com>

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "man/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
}
