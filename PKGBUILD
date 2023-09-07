# Maintainer: knedl1k <knedl1k At tuta Dot io> 
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

_name='git-praise'
pkgname='praise'
pkgver=1.4.0
pkgrel=1
pkgdesc='A nicer git blame'
url='https://github.com/sigvef/git-praise'
arch=('any')
license=('MIT')
depends=('python' 'python-gitpython' 'python-pygments' 'python-click'
         'python-termcolor' 'flake8')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aec630b9ce7013efde65160e44a836789efce2fcf849d7a487cbeebc2b5825ad')

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

