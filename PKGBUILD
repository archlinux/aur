# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=wish-agent-bin
_pkgname=wish-agent
pkgver=0.2.5
pkgrel=1
pkgdesc="Self-hosted AI agent server and web app: long-lived sessions, shell tools and many model providers"
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/wish-core"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git" 'tk')
options=('!strip' '!debug')
source=("wish-agent.service")
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('932ff80ab90865dbeb39168c36293738af32ec5f197c7630930d0a54c2bac0d0')
sha256sums_x86_64=('7f197b1d561f15d32456d6dfae7881d92f5c5b9587080313217d36de3d5cc300')
sha256sums_aarch64=('191068a5c5158ac5da02ada2294282629232ff7a948a98f2dfc64fe37bd142d7')

package() {
  cd "$srcdir/$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"

  # The program finds its web app beside it; /usr/bin holds a link. Tk's `wish` is the same path.
  install -Dm755 wish "$pkgdir/usr/lib/$_pkgname/wish"
  cp -r web "$pkgdir/usr/lib/$_pkgname/web"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/wish" "$pkgdir/usr/bin/wish"
  install -Dm644 "$srcdir/wish-agent.service" "$pkgdir/usr/lib/systemd/user/wish-agent.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
