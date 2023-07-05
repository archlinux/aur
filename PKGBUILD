#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='swmm5-git'
#_gitname='swmm5'
_gitname='Stormwater-Management-Model'
pkgver=5.2.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://github.com/USEPA/Stormwater-Management-Model"
#depends=('kernel26>=2.6.29')
makedepends=('git')
license=('Public Domain')
pkgdesc="Hydraulic and hidrologic modelation engine for wastewater drainage systems."
provides=(swmm5)
conflicts=(swmm5)
#source=("git://github.com/lothar-mar/swmm5.git#branch=testing")
source=("git+https://github.com/USEPA/Stormwater-Management-Model.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  # run cmake
  cmake -S . -B build
  # create swwm5 executable
  cd "$srcdir/$_gitname/build"
	make
}

package() {
  # install swmm executable
  install -D -m755 "$srcdir/$_gitname/build/bin/runswmm" "$pkgdir/usr/bin/swmm5"
  install -D -m755 "$srcdir/$_gitname/build/bin/libswmm5.so" "$pkgdir/usr/lib/libswmm5.so"

  # install license
	#install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

