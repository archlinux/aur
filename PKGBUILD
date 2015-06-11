#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='epanet2.toolkit-git'
_gitname='epanet2.toolkit'
pkgver=1.5
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.epa.gov/"
depends=('epanet2-git')
#optdepends=()
makedepends=('git')
license=('GPL')
pkgdesc="The EPANET Toolkit allows researchers to use the simulation engine within other applications, such as optimisation algorithms."
options=('staticlibs')
provides=(epanet2.toolkit)
conflicts=(epanet2.toolkit)
#source=("https://bitbucket.org/lothar_m/"$_gitname"/"$_gitname".git")
source=("git+https://bitbucket.org/lothar_m/"$_gitname"/"$_gitname".git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  cd "$srcdir/$_gitname"

 # make the  executable and shared object library
	#cd "$srcdir/$_gitname/src"
	cd "$srcdir/$_gitname/src"
	make toolkit
}

package() {
# install header file to /usr/include
	install -D -m755 "$srcdir/$_gitname/toolkit.h" "$pkgdir/usr/include/toolkit.h"
# install library to /usr/lib
	install -D -m755 "$srcdir/$_gitname/libtoolkit.a" "$pkgdir/usr/lib/libtoolkit.a"
# install license
	install -D -m644 "$srcdir/$_gitname/src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

