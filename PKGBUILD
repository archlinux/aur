# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pyshark-git
pkgver=v0.4.3.r10.g753cd0a
pkgrel=1
pkgdesc='Python wrapper for tshark, allowing python packet parsing using wireshark dissectors (git version)'
url='https://github.com/KimiNewt/pyshark'
arch=('any')
license=('MIT')
depends=('wireshark-cli' 'python-py' 'python-lxml')
makedepends=('python-setuptools')
source=("git+https://github.com/KimiNewt/pyshark.git")
sha512sums=('SKIP')
provides=('python-pyshark')
conflicts=('python-pyshark')

pkgver() {
  cd "pyshark"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pyshark/src"
  python setup.py build
}

package() {
  
  cd "pyshark/src"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: ts=2 sw=2 et:
