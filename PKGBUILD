# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

# pkgbase=python-requests-cache-git
# _pyname=requests-cache
# pkgname=('python-requests-cache' 'python2-requests-cache')
pkgname=python-requests-cache-git
pkgver=0.1
pkgrel=1
pkgdesc="Persistent cache for requests library(git version)"
arch=('any')
url="https://github.com/reclosedev/requests-cache"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+https://github.com/reclosedev/requests-cache")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 
}

package() { 
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}