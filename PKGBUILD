# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Guenther Starnberger <guenther at starnberger dot name>

pkgname=ddar-git
pkgver=r112.8ce4727
pkgrel=1
pkgdesc="Free de-duplicating archiver for Unix (git)"
arch=('any')
url='http://www.synctus.com/ddar/'
license=('GPLv3')
depends=('python2' 'python2-protobuf')
makedepends=('setuptools')
#source=("http://www.synctus.com/bits/ddar/ddar-sdist-$pkgver.tar.gz")
source=("${pkgname}"::'git+https://github.com/basak/ddar')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  python2 setup.py install --root="$pkgdir"

  # Source package is missing __init__.py
  find $pkgdir -name synctus -exec touch {}/__init__.py \;
}
