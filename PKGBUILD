# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=mongars
pkgver=0.1.1
pkgrel=1
pkgdesc="Count inbox emails using Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/mongars"
license=('Apache')
depends=('python-gobject' 'evolution-data-server')
source=( https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('7e7fcc4af39315f61ab7ec95f563fab238e208c4f23f899257c97bf5312e60a1')
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
