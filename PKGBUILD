# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mimetic"
pkgname="${_name}-docs"
pkgver=0.9.8
pkgrel=1
pkgdesc="A free, MIT licensed, Email library (MIME) written in C++ (documentation)"
arch=('any')
url="https://www.codesink.org/mimetic_mime_library.html"
license=('MIT')
makedepends=('doxygen' 'graphviz')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://www.codesink.org/download/${_pkgsrc}.tar.gz")
b2sums=('16dcd2a869a5ec92f8aeffca52f41aa1773ad1446302cf827d25ac27c407bcb7e59ed3f8868a00102ec19ef874da440e72f80cb42150a20dfd962af5173901f8')

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
