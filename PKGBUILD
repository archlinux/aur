# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mimetic"
pkgname="${_name}-docs"
pkgver=0.9.8+r47+2be9506
_commit_rel="44b94873f8e6c4d1e1ea9b6c4ef8e1e50dbf3ff4" # 0.9.8
_commit="2be9506c9e00180b662461cc064305c82c220bf0"
pkgrel=1
pkgdesc="A free, MIT licensed, Email library (MIME) written in C++ (documentation)"
arch=('any')
url="https://www.codesink.org/mimetic_mime_library.html"
_url="https://github.com/tat/${_name}"
license=('MIT')
makedepends=('doxygen' 'graphviz')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
b2sums=('562257f49290b6535e46858d8228f478453899a827ded93f8f23e2920055069e1b2c88753ccc6ba3146db6ebadf08f348627c9430d2344dcce0752f829e94566')

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./configure \
    --prefix='/usr'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  
  cd "doc"
  make docs
}

package() {
  cd "${srcdir}/${_pkgsrc}/doc"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/{}" \;
}
