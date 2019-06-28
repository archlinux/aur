# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>
pkgname=udemy-dl-git
pkgver=v0.5.r59.gc56a725
pkgrel=1
pkgdesc='A utility to download courses from udemy for personal offline use'
arch=('any')
url="https://github.com/r0oth3x49/udemy-dl"
license=('MIT')
depends=('python' 'python-requests' 'python-colorama' 'python-unidecode' 'python-six' 'python-pyopenssl')
makedepends=('git')
provides=('udemy-dl')
conflicts=('udemy-dl')
source=("${pkgname}::git+https://github.com/r0oth3x49/udemy-dl.git"
        'setup.py')
sha256sums=('SKIP'
            'cc22a6b83b949b502ed951832845cae42703432dbf7ca2336d19991b946eb983')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  install -Dm 0644 ../setup.py .
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
