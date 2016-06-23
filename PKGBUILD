pkgname=aurutils-git
pkgver=1.0.2.r20.g6b11fc8
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("git+$url")
md5sums=('SKIP')
conflicts=('aurutils')
provides=('aurutils')
depends=('pacman>=5.0' 'git' 'expac' 'jshon' 'aria2'
         'pacutils' 'repose')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: build in an nspawn container'
            'vifm: improved build file interaction'
            'datamash: check tsort input')

pkgver() {
  cd aurutils
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

check() {
  cd aurutils
  make check
}

package() {
  cd aurutils
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
