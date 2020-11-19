# Maintainer: Yohann D'ANELLO <ynerant@crans.org>

pkgbase=squirrel-battle
pkgname=python-squirrel-battle
pkgver=3.14
pkgrel=2
pkgdesc="Watch out for squirrel's knives!"
arch=('any')
url="https://gitlab.crans.org/ynerant/squirrel-battle"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
depends=('noto-fonts-emoji')
checkdepends=('python-tox')
source=("https://gitlab.crans.org/ynerant/squirrel-battle/-/archive/v3.14/$pkgbase-v$pkgver.tar.gz")
sha256sums=("6090534d598c0b3a8f5acdb553c12908ba8107d62d08e17747d1dbb397bddef0")

build() {
  cd $pkgbase-v$pkgver
  python setup.py build
}

check() {
  cd $pkgbase-v$pkgver
  tox -e py3
  tox -e linters
}

package() {
  cd $pkgbase-v$pkgver
  python setup.py install --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
