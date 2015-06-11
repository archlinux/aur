#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='epanet2-git'
_gitname='epanet2'
pkgver=2.00.12
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.epa.gov/"
#depends=('kernel26>=2.6.29')
optdepends=('programmers-toolkit-git: Toolkit for specialized applications development.'
			'MultiSpecies-eXtension-git: enables EPANET to model complex reaction schemes between multispecies.'
			)
makedepends=('git')
license=('Public Domain')
pkgdesc="EPANET performs extended period simulation of the water movement and quality behavior within pressurized pipe networks."
provides=(epanet2)
conflicts=(epanet2)
source=("git://github.com/lothar-mar/epanet2.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  cd "$srcdir/$_gitname"

 # make swwm5 executable and shared object library
	#cd "$srcdir/$_gitname/src"
	cd "$srcdir/$_gitname/build/Linux"
	make
}

package() {
# install swmm executable
	install -D -m755 "$srcdir/$_gitname/build/Linux/epanet2" "$pkgdir/usr/bin/epanet2"
# install shared object library
	install -D -m755 "$srcdir/$_gitname/build/Linux/libepanet2.so" "$pkgdir/usr/lib/libepanet2.so"
# install header file (needed to compile the SOL
	install -D -m755 "$srcdir/$_gitname/include/epanet2.h" "$pkgdir/usr/include/epanet2.h"
# install license
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

