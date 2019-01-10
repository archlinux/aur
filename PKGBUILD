# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name='git-praise'
pkgname='praise'
pkgver=1.3.0
pkgrel=3
pkgdesc='A nicer git blame'
url='https://github.com/sigvef/git-praise'
arch=('any')
license=('MIT')
depends=('python' 'python-gitpython' 'python-pygments' 'python-click'
         'python-termcolor' 'flake8')
provides=("${pkgname}=${pkgver}")
# https://github.com/sigvef/git-praise/archive/v1.2.0.tar.gz
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a29879edf9b976f700df4f588667580d37bd4f1602605b255948f84fa8049ff3')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # remove all hard version pinning:
  sed -e 's/==/>=/g' -i setup.py
}

# Enable for tests
check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  # install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
