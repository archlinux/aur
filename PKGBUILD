# Maintainer: Brian Cooper <brian at brian-cooper dot com>
# Contributor: Jonathan Rouleau <jonathan@rouleau.io>
pkgname=udemy-dl-git
pkgver=1.1.r1.g595c003
pkgrel=1
pkgdesc='A utility to download courses from udemy for personal offline use'
arch=('any')
url="https://github.com/r0oth3x49/udemy-dl"
license=('MIT')
depends=('python' 'python-requests' 'python-colorama' 'python-unidecode' 'python-six' 'python-pyopenssl' 'python-m3u8' 'python-cloudscraper')
makedepends=('git')
provides=('udemy-dl')
conflicts=('udemy-dl')
source=("${pkgname}::git+https://github.com/r0oth3x49/udemy-dl.git"
        'setup.py')
sha256sums=('SKIP'
            '6e3c4997604f2efbed7002fd578b79f1f7bce13cda254f68e0f056afcefaca4b')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
