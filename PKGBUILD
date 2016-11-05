# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=tv-renamer-git
pkgver=0.3.2.r0.gff04899
pkgrel=1
pkgdesc="A TV series renaming application written in the Rust that supports adding titles to episodes using TVDB and with both a CLI and GTK3 interface"
arch=('i686' 'x86_64')
url="https://github.com/mmstick/tv-renamer/"
license=('MIT')
depends=('gtk3' 'openssl')
makedepends=('cargo' 'git')
provides=("${pkgname%-git*}-gtk")
conflicts=("${pkgname%-git*}")
source=("$pkgname::git+https://github.com/mmstick/${pkgname%-git*}/#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/usr" install
  mv "$pkgdir/usr/share/licenses/tv-renamer" "$pkgdir/usr/share/licenses/$pkgname"
}
