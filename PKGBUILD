#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='swmm5-git'
_gitname='swmm5'
pkgver=5.0.022
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.epa.gov/"
#depends=('kernel26>=2.6.29')
makedepends=('git')
license=('Public Domain')
pkgdesc="Hydraulic and hidrologic modelation engine for wastewater drainage systems."
provides=(swmm5)
conflicts=(swmm5)
source=("git://github.com/lothar-mar/swmm5.git#branch=testing")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  cd "$srcdir/$_gitname"

 # make swwm5 executable
   cd "$srcdir/$_gitname/src"
	make
}

package() {
 # install swmm executable
   install -D -m755 "$srcdir/$_gitname/src/swmm5" "$pkgdir/usr/bin/swmm5"

 # install license
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

