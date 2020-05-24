# Maintainer: Michael Armbruster <michael at armbrust dot me>

pkgname=nsz-git
pkgrel=6
pkgver=3.1.1
pkgdesc='Switch Homebrew compatible NSP/XCI compressor/decompressor'
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=$pkgver")
arch=('any')
url='https://github.com/nicoboss/nsz'
license=('MIT')
depends=('python>=3.6' 'python-pycryptodome>=3.9.0' 'python-zstandard' 'python-enlighten')
optdepends=('python-pygame' 'python-kivy==1.11.1')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+https://github.com/nicoboss/${pkgname%-*}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
