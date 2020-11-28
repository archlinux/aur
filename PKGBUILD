# Maintainer: Yohann D'ANELLO <ynerant@crans.org>

name=squirrel-battle
pkgname=python-squirrel-battle
pkgver=3.14.1
pkgrel=2
pkgdesc="Watch out for squirrel's knives!"
arch=('any')
url="https://gitlab.crans.org/ynerant/squirrel-battle"
license=('GPLv3')
depends=('python')
makedepends=('gettext' 'python-setuptools')
depends=('noto-fonts-emoji')
checkdepends=('python-tox')
source=("https://gitlab.crans.org/ynerant/squirrel-battle/-/archive/v$pkgver/$name-v$pkgver.tar.gz")
sha256sums=("530062729aa592c83474e192793d040451f5f789579360892cd480b5603aaca1")

build() {
  cd $name-v$pkgver
  python setup.py build
}

check() {
  cd $name-v$pkgver
  tox -e py3
  tox -e linters
}

package() {
  cd $name-v$pkgver
  python setup.py install --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
