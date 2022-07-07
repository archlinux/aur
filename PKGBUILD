# Maintainer: zhs <zhao4she4@tuta.io>
# by and large a copy of the stable version one by radioxoma with a few
# small modifications

pkgname=lsdreader-git
_pkgname=lsdreader
pkgver=0.2.15.r18.g6276e75
pkgrel=1
pkgdesc="Decompile ABBYY Lingvo LSD dictionaries to DSL, git version"
arch=('any')
url="https://github.com/sv99/lsdreader"
license=('unknown')
depends=('python')
provides=('lsdreader')
conflicts=('lsdreader')
makedepends=('python-setuptools')
source=("git+https://github.com/sv99/lsdreader")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r'$(git rev-list --count HEAD)'.g/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}"
    sed -i 's/\\n/ /g' setup.py  # ValueError: Newlines are not allowed
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1
}
