# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=gerbolyze
pkgver=3.0.7
pkgrel=1
pkgdesc="A high-resolution image-to-PCB converter"
arch=('any')
url="https://gerbolyze.jaseg.net/"
license=('AGPL')
depends=("python-numpy" "python-slugify" "python-lxml" "python-click" "python-appdirs" "python-text-unidecode" "resvg-cairo" "python-gerbonara")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}::git+https://gitlab.com/gerbolyze/gerbolyze.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  git submodule update --init
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

