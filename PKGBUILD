# Maintainer: Yohann D'ANELLO <ynerant@crans.org>

_name=squirrel-battle
pkgname=python-squirrel-battle-git
pkgrel=2
pkgdesc="Watch out for squirrel's knives!"
arch=('any')
url="https://gitlab.crans.org/ynerant/squirrel-battle"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
depends=('noto-fonts-emoji')
checkdepends=('python-tox')
source=("git+https://gitlab.crans.org/ynerant/squirrel-battle.git")
sha256sums=("SKIP")

pkgver() {
  cd $_name
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_name
  python setup.py build
}

check() {
  cd $_name
  tox -e py3
  tox -e linters
}

package() {
  cd $_name
  python setup.py install --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
