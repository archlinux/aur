# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname='chs-git'
_pkgname='chs'
pkgver='2.2.0.r4.gc3eda7c'
pkgrel=1
pkgdesc='Play chess against the Stockfish engine in your terminal.'
url='https://github.com/nickzuber/chs'
depends=('python' 'python-chess' 'python-editdistance')
checkdepends=('python-pytest' 'python-setuptools')
makedepends=('git')
provides=("chs")
conflicts=("chs")
license=('MIT')
arch=('any')
source=("${_pkgname}::git://github.com/nickzuber/chs")
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
