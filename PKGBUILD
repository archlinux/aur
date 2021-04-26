# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-sniffer
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc='Autotesting tool for Python using nosetest'
url="https://github.com/jeffh/${_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-colorama' 'python-termstyle' 'python-nose')
makedepends=('python-setuptools')
optdepends=('python-pyinotify: More efficient monitoring of file changes')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${_name}-${pkgver}-LICENSE.txt::${url}/raw/e5970034078be3d6c8885cf87b28a5327a6e7bbc/LICENSE.txt") # ${url}/raw/v${pkgver}/LICENSE.txt
b2sums=('7f0d8c5efb6ddd1efe8d176815576ef2874423f2deb80a737251040123d1c0c7d45bc89d0d39200aefeba1a8ac571147e9aaed7fe70e869d46e420730bfeede0'
        '66eacf3e8a940ee78c5b6fc8bea81722cf782180524b46aedff7cc8746de8fd1798a130a2d39a7f603f4e17e8c30e294f18818673fa8fe175fd0897d380799a3')

build() {
  cd "${_name}-${pkgver}"
  python3 setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  python3 -m nose
}

package() {
  cd "${_name}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
