pkgname=aurutils
pkgver=1.3.2
pkgrel=2
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
depends=('pacman>=5' 'expac>=7' 'aria2>=1.23' 'git' 'jshon'
	 'repose' 'pacutils')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: build in an nspawn container'
	    'vifm: improved build file interaction'
	    'datamash: check tsort input')
source=("$pkgname-$pkgver::git+$url#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  git cherry-pick 8ead5203711263b4b895bfd698fba0d021581412
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
