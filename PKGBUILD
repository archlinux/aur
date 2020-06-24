# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver='1.5.2'
pkgrel=1
pkgdesc="Command-line tool to check C/C++ files for style issues following Google's C++ style guide."
arch=('any')
url='https://github.com/cpplint/cpplint'
license=('custom:BSD3')
depends=('python')
provides=('cpplint' 'cpplint-py3')
replaces=('cpplint-py3')
conflicts=('cpplint')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5ace9cb77ddfa61bb0135b21d8a3fe62970266588ba41b8a644cd271d3c0676e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "cpplint.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
