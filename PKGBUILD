# Maintainer: lmartinez-mirror
pkgname=blacktex-git
pkgver=0.3.3.r4.g4be1761
pkgrel=1
pkgdesc="A LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.7')
makedepends=('git' 'python-setuptools' 'python-dephell')
checkdepends=('python-tox')
provides=('blacktex')
conflicts=('blacktex')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$pkgname"
  python setup.py build
}

check() {
  cd "$pkgname"
  tox
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
