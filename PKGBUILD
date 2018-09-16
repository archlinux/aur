# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=codequery-nogui
_name=codequery
pkgver=0.21.1
pkgrel=1
pkgdesc='A code-understanding, code-browsing or code-search tool.'
arch=(i686  x86_64)
url=http://ruben2020.github.io/codequery/
license=(GPL3)
depends=()
provides=(codequery)
makedepends=(cmake)
optdepends=('cscope: creation of CodeQuery databases'
            'ctags: creation of CodeQuery databases'
            'python-pycscope: creation of CodeQuery databases for Python source code'
            'ruby-starscope: creation of CodeQuery databases for Ruby and Go source code')
source=(
	https://github.com/ruben2020/codequery/archive/v${pkgver}.tar.gz
	nogui.patch::https://github.com/ruben2020/codequery/commit/b910df7eba370db1aaa623880d44da1dcb0e4c6a.patch
)
md5sums=('4ecb79636f76d89599384cc49d04e04b'
         '06745085cbd9aa30d59ea25a1cf0e6cf')

build() {
  cd ${srcdir}/${_name}-${pkgver}

  patch -p1 < ../nogui.patch

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DNO_GUI=ON -G 'Unix Makefiles' .. 
  make
}

package() {
  cd ${srcdir}/${_name}-${pkgver}/build

  make DESTDIR=${pkgdir} install
}
