pkgname=miniss
pkgver=0.0.2.r1.g7ad0621
pkgrel=1
pkgdesc='Displays a list of open listening sockets. It is a minimal alternative to ss or netstat.'
arch=('x86_64' 'aarch64')
url='https://github.com/noraj/miniss'
license=('MIT')
depends=()
makedepends=('git' 'crystal' 'shards')
source=("git+https://github.com/noraj/$pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  shards install --production
  shards build --production --release --no-debug
}

package() {
  cd $pkgname

  install -Dm 755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" docs/*.md *.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

