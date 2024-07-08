# Dog icon by ecuabron ( https://openclipart.org/detail/204954/dog )

# Contributor: Fabio Comuni <fabrixxm@kirgroup.com>
# Contributor: David Vogt <dave at winged dot ch>
# Maintainer: Éric Gillet <e + aur2419 at linuxw dot info>

pkgname=pugdebug-git
_pkgname=pugdebug-git
pkgver=1.1.1.r1.gd070445
pkgrel=1
pkgdesc="PugDebug is a standalone debugging client for PHP applications that uses XDebug as the debugging engine"
arch=('any')
license=('GPL3')
url='https://github.com/mte90/pugdebug'
depends=('python>=3.7' 'python-pyqt5' 'python-pygments' 'flake8' 'python-fuzzywuzzy' 'python-levenshtein')
conflicts=()
provides=('pugdebug')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/Mte90/pugdebug.git"
	PugDebug.desktop 
	dog.png)

md5sums=('SKIP'
         '0a6f0a35199b4b0eccbd5291b180e553'
         '4a382fe99a6d4e9fafc5a047af77402b')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}	

package() {
	install -D -m655 "${srcdir}/PugDebug.desktop" "$pkgdir/usr/share/applications/PugDebug.desktop"
	
	install -D -m655 ${srcdir}/dog.png "$pkgdir/usr/share/pixmaps/pugdebug.png"
	
	cd "${srcdir}/${_pkgname}"
	sed "s/:version:/$pkgver/" setup.py
	python setup.py install --root="${pkgdir}"
	
	install -TD app.py "${pkgdir}/usr/bin/pugdebug"
	
	install -D -m655 LICENSE "${pkgdir}/usr/share/pugdebug/LICENSE"
	install -D -m655 COPYING "${pkgdir}/usr/share/pugdebug/COPYING"
}
