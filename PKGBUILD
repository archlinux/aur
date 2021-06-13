# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gpg-tui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A terminal user interface for GnuPG"
arch=('x86_64')
url="https://github.com/orhun/gpg-tui"
license=('MIT')
depends=('libxcb' 'gpgme')
optdepends=('xplr: file selection support')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.sig})
sha512sums_x86_64=('920034404f4af81813ab0fc160b8d10069bf3754254f69308be3d6bb6e74e36463626e8259f6b7025d6fc19de33a3f51f99c8ae8bd9e9c9afea92e8f586cd47f'
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
