# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=mongars
pkgver=0.0.1
pkgrel=1
pkgdesc="Count inbox emails using Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/mongars"
license=('Apache')
depends=('python-gobject' 'evolution-data-server' 'python-imapclient')
source=( https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('12e5691196ac06b079ea36a106a120aab84d3b16a1940a70f3940bfbb7027a44')
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
