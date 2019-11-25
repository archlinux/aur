# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-pycobertura-git
pkgver=0.10.5+2.g25ce699cfb
pkgrel=1
pkgdesc="Code coverage diff tool for Cobertura reports"
arch=(x86_64)
url="https://github.com/aconrad/pycobertura"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
depends=(python python-{click,colorama,jinja,lxml,tabulate})
makedepends=(python-setuptools)
conflicts=(python-pycobertura)
provides=("python-pycobertura=${pkgver%+*}")

pkgver() {
  cd pycobertura
  git describe --long --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd pycobertura
  python setup.py build
}

package() {
  cd pycobertura
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
