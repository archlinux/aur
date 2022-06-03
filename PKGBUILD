# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname='chs-git'
_pkgname='chs'
pkgver=3.0.0.r3.gf9c7b1b
pkgrel=1
pkgdesc='Play chess against the Stockfish engine in your terminal.'
url='https://github.com/nickzuber/chs'
depends=('python' 'python-chess' 'python-editdistance')
checkdepends=('python-pytest')
makedepends=('git' 'python-setuptools')
provides=("chs")
conflicts=("chs")
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

check(){
  cd "${srcdir}/${_pkgname}"

	pytest
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
