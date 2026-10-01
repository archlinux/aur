# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=wish-agent-bin
_pkgname=wish-agent
pkgver=0.1.1
pkgrel=1
pkgdesc="Self-hosted AI agent server and web app: long-lived sessions, shell tools and many model providers"
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/wish-core"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("wish-agent.service")
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('25634e8af4577f11942192e92101376aab960ba40c7350f7d6ba8b806a174791')
sha256sums_x86_64=('4fbe6a0132ab6a0cb43178bcd01a92e1cc44d9140517c708a478783d38c27989')
sha256sums_aarch64=('30ae81bd84eb50e172de3fa2a4fbc3854cc804badb42427cca638080c1e916be')

package() {
  cd "$srcdir/$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"

  # The program finds its web app beside it; /usr/bin holds a link.
  install -Dm755 wish "$pkgdir/usr/lib/$_pkgname/wish"
  cp -r web "$pkgdir/usr/lib/$_pkgname/web"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/wish" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/wish-agent.service" "$pkgdir/usr/lib/systemd/user/wish-agent.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
