# Maintainer: Antoni Spaanderman <56turtle56@gmail.com>

pkgname=pacman-cache-server-git
pkgver=8.0e2cb61
pkgrel=1
pkgdesc="Caching pacman mirror for faster downloads at home"
arch=('any')
url=https://github.com/antonilol/pacman-cache-server
license=('MIT')
source=("pacman-cache-server::git+$url" "pacman-cache-server.service")
md5sums=('SKIP')
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
  cp pacman-cache-server.service /usr/lib/systemd/system
}
