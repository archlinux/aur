# Contributor: quellen <lodgerz@gmail.com>
_pkgname=amitools
pkgname="${_pkgname}-git"
pkgver=0.7.0.r1.g3bbafc4
pkgrel=1
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=()
makedepends=(
  'git'
  'python-setuptools'
)
provides=("${_pkgname}")
conflicts=(${provides[@]})

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//'
}

build() {
  cd "${srcdir}/$_pkgname"
  python setup.py build
}

package() {
  depends=('python')

  cd "${srcdir}/$_pkgname"
  python setup.py install --root="$pkgdir/" --prefix=/usr
} 
