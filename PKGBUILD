# Maintainer: Antoni Spaanderman <56turtle56@gmail.com>

pkgname=pacman-cache-server-git
pkgver=8.0e2cb61.2
pkgrel=1
pkgdesc="Caching pacman mirror for faster downloads at home"
arch=('any')
url=https://github.com/antonilol/pacman-cache-server
license=('MIT')
source=("pacman-cache-server::git+$url" "pacman-cache-server.service")
sha256sums=('SKIP' 'c4b943a9b5db96d777b82d6180025893684f67a29926644e728b274c8df5fe97')
depends=('nodejs' 'npm')
makedepends=('git')

build() {
  cd "$srcdir/pacman-cache-server"
  npm i
  npm run build
}

package() {
  mkdir -p "$pkgdir"/usr/{bin,lib/systemd/system}
  cp -r "$srcdir"/pacman-cache-server "$pkgdir"/usr/lib/"$pkgname"
  cp pacman-cache-server.service "$pkgdir"/usr/lib/systemd/system
}
