# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=codequery
pkgver=0.21.0
pkgrel=1
pkgdesc='A code-understanding, code-browsing or code-search tool.'
arch=(i686  x86_64)
url=http://ruben2020.github.io/codequery/
license=(GPL3)
depends=(qscintilla)
makedepends=(cmake)
optdepends=('cscope: creation of CodeQuery databases'
            'ctags: creation of CodeQuery databases'
#            'python2-pycscope: creation of CodeQuery databases for Python source code'
            'ruby-starscope: creation of CodeQuery databases for Ruby and Go source code')
install=codequery.install
source=(https://github.com/ruben2020/codequery/archive/v${pkgver}.tar.gz codequery.desktop)
md5sums=('8e7ca5826939be860b161a7310dd6429'
         'ad7e15affffa643a29a6afdd47200006')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -G 'Unix Makefiles' ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir} install

  install -D -m 644 ${srcdir}/codequery.desktop ${pkgdir}/usr/share/applications/codequery.desktop
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/gui/images/logo.png ${pkgdir}/usr/share/pixmaps/codequery.png
}
