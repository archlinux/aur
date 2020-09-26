# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver='1.5.4'
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
sha256sums=('e254b5620fb039689b8f5e64b07384ee53beb695304c5c01195133be662b4457')

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
