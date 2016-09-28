pkgname=aurutils-git
pkgver=1.3.3.r34.g749e2c5
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("git+$url")
md5sums=('SKIP')
conflicts=('aurutils')
provides=('aurutils')
depends=('pacman>=5.0' 'git' 'expac' 'jq' 'pacutils' 'repose')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: systemd-nspawn support'
	'vifm: build file interaction'
	'parallel: download performance'
	'aria2: download performance'
	'datamash: check tsort input')
optdepends=('devtools' 'vifm' 'parallel' 'datamash')

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
