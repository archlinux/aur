# Maintainer: Tom Lauerman  <tom at lauerman dot dev>

pkgname=jenv-git
_pkgname=jenv
pkgver=0.5.4.r2.9bbc5eb
pkgrel=1
pkgdesc="A command line tool to manage your Java environment"
arch=('any')
url="https://www.jenv.be"
license=('MIT')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=jenv-git.install
source=("$pkgname::git+https://github.com/jenv/jenv.git" 'init-jenv.sh')
md5sums=('SKIP' 'ef913922693b155cb4e0230022c5d03b')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir"

  # install one-off files
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 init-jenv.sh "$pkgdir/usr/share/$pkgname/init-jenv.sh"

  # install jenv application data
  mkdir -p "$pkgdir/usr/share/$pkgname/"
  cp -r "$pkgname/"* "$pkgdir/usr/share/$pkgname"
}

