# Maintainer: Lothar_m <lothar_m at riseup dot net>
 
_pkgname=ofxparse
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="Ofxparse is a parser for Open Financial Exchange (.ofx) format files."
arch=('i686' 'x86_64')
url="https://github.com/jseutter/ofxparse"
license=('MIT')
makedepends=('git')
depends=('python2>=2.7.6'
		 'python2-nose'
		 'python2-coverage'
		 'python2-beautifulsoup4')
#optdepends=('')
provides=($_pkgname)
conflicts=($_pkgname)
source=('ofxparse::git+https://github.com/jseutter/ofxparse.git#branch=master')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/$_pkgname"
    ( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

 
build() {
  cd $_pkgname
  python2 setup.py build
}
 
package() {
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

