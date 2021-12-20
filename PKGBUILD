# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=mongars
pkgver=0.1.0
pkgrel=1
pkgdesc="Count inbox emails using Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/mongars"
license=('Apache')
depends=('python-gobject' 'evolution-data-server')
source=( https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('bdf00fa8acc371128d9dd0a5d122dbba0ba209c5739b46a73b19e70885e4820e')
makedepends=("python-setuptools" "python-dephell")

prepare() {
    cd "$pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
