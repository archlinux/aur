# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=castxml-git
_gitname=CastXML
pkgdesc="C-family abstract syntax tree XML output tool."
pkgver=552dd69
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/CastXML/CastXML"
license=('APACHE')
depends=('llvm' 'clang')
makedepends=('git' 'cmake' 'python-sphinx')
provides=('castxml')
conflicts=('castxml')
source=(
  'git://github.com/CastXML/CastXML'
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  cmake -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build \
        -DSPHINX_HTML=1 \
        -DSPHINX_MAN=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCastXML_INSTALL_DOC_DIR=share/doc/castxml \
        -DCastXML_INSTALL_MAN_DIR=share/man
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package(){
  cd "$srcdir/${_gitname}"
  make DESTDIR="$pkgdir" install
}
