# Maintainer: Michael Armbruster <michael at armbrust dot me>

pkgname=nsz-git
pkgrel=3
pkgver=3.1.1.r25.g571147e
pkgdesc='Switch Homebrew compatible NSP/XCI compressor/decompressor'
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=$pkgver")
arch=('any')
url='https://github.com/nicoboss/nsz'
license=('MIT')
depends=('python>=3.6' 'python-pycryptodome>=3.9.0' 'python-zstandard' 'python-enlighten')
optdepends=('python-pygame' 'python-kivy==1.11.1')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+https://github.com/nicoboss/${pkgname%-*}.git"
        '0001-Stopping-the-bar-manager-is-needed-to-properly-reset.patch')
sha256sums=('SKIP'
            '55171dd660017e425ddcd73cb76ce684d3ce41cb997d8fd6e50263a91a2c4997')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -d "${pkgname}" -Np1 -i "${srcdir}/0001-Stopping-the-bar-manager-is-needed-to-properly-reset.patch"
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
