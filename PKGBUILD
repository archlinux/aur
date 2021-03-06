# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=gerbolyze
pkgver=2.0.6
pkgrel=1
pkgdesc="A high-resolution image-to-PCB converter"
arch=('any')
url="https://gerbolyze.jaseg.net/"
license=('AGPL')
depends=("usvg" "pugixml" "opencv" "pango" "cairo" "python-numpy" "python-slugify" "python-lxml" "python-click" "python-pcb-tools" "python-pcb-tools-extension")
makedepends=('python-setuptools' 'pkgconf' 'git')
source=("${pkgname}-${pkgver}::git+https://github.com/jaseg/${pkgname}.git#tag=v${pkgver}")
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

