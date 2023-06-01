# Maintainer: Matthew Geskey <vitrvvivs.architectus@gmail.com>

pkgname=python-yacker-git
pkgver=2019.1.r0.ge959885
pkgrel=2
pkgdesc="A YAML wrapper around Packer"
arch=('any')
url="https://gitlab.com/matilda.peak/yacker"
source=(
  'git+https://gitlab.com/vitrvvivs/yacker.git'
  'requirements.txt.patch'
)
md5sums=(
  'SKIP'
  'e99ac7a240eca1e3f2e70775417af49b'
)
depends=('packer' 'python' 'python-pyaml')
makedepends=('python-setuptools')

_name=yacker

pkgver() {
  cd "$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_name"
  git apply "$srcdir/requirements.txt.patch"
}

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:

