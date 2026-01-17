# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: whiteman808 <whiteman808@paraboletancza.org>

pkgname='python-pkb-client-git'
pkgver='r270.bd8d4cc'
pkgrel=1
pkgdesc='Unofficial client for the Porkbun API'
arch=('any')
license=('MIT')
url='https://github.com/infinityofspace/pkb_client'
depends=('python-requests' 'python-responses' 'python-dnspython')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')
provides=('python-pkb-client')
conflicts=('python-pkb-client')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  find "$pkgdir/usr/lib" -type d -path "*/site-packages/tests" -exec rm -rf {} +
}
