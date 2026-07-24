# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=rmux-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='Universal Rust multiplexer with a typed SDK'
arch=('x86_64')
url=https://github.com/Helvesec/rmux
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
depends=(glibc libgcc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
	$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x86_64.tar.gz
)

sha256sums=('f7e91baa912e942c1fd090b9bfb30142d51ac1da8b142e088e6b3a417321d54b')

package() {
  cd "${pkgname%-bin}-$pkgver-linux-x86_64"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "share/man/man1/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "share/bash-completion/completions/${pkgname%-bin}" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm644 "share/elvish/lib/${pkgname%-bin}.elv" -t "$pkgdir/usr/share/elvish/lib/"
  install -Dm644 "share/fish/vendor_completions.d/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "share/zsh/site-functions/_${pkgname%-bin}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm0755 "bin/${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0755 "bin/${pkgname%-bin}-daemon" -t "$pkgdir/usr/bin/"
  install -Dm0755 "libexec/${pkgname%-bin}/${pkgname%-bin}" -t "$pkgdir/usr/lib/libexec/${pkgname%-bin}/"
}
