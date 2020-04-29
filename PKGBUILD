# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=python-pep-adapter-hg
_name=pEpPythonAdapter
pkgver=r179.da8d0de6e5f2
pkgrel=1
pkgdesc="p≡p Python adapter"
url="https://github.com/myint/language-check"
depends=('python' 'pep-engine' 'boost' 'boost-libs' 'gcc')
makedepends=('python')
optdepends=()
license=('GPL3')
arch=('any')
source=("hg+https://pep.foundation/dev/repos/${_name}")
sha256sums=('SKIP')
provides=('python-pep-adapter')

pkgver() {
  cd "$srcdir/${_name}"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/${_name}"
  
  sed -i 's/\-mt//g' setup.py
  python3 setup.py build_ext
}

package() {
  cd "$srcdir/${_name}"
  
  python3 setup.py install --root="$pkgdir" --optimize=1
}
