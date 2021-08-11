# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/anaseto/boohu
# Upstream: https://github.com/anaseto/boohu

pkgname=('boohu-git')
pkgver=0.13.0.5.g9103191
pkgrel=1
pkgdesc="Break Out Of Hareka's Underground, a roguelike game."
arch=('i686' 'x86_64')
url='https://github.com/anaseto/boohu'
license=('ISC')
depends=()
makedepends=('git' 'go')
provides=('boohu')
#conflicts=('boohu')
source=("$pkgname::git+https://github.com/anaseto/boohu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$pkgname"
  go mod init "${url#https://}" # strip https:// from canonical URL
  go mod tidy
}

build() {
  cd "$pkgname"
  go build -o boohu .
}

package() {
  install -Dm 755 "$srcdir/$pkgname/boohu" -t "$pkgdir/usr/bin";
  install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
