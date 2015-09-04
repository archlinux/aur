# Maintainer: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Nicolas Floquet <nicolasfloquet AT gmail DOT com>
pkgname=e2tools
pkgver=0.0.16
pkgrel=2
pkgdesc="A simple set of GPL'ed utilities to read, write, and manipulate files in an ext2/ext3 filesystem."
arch=('i686' 'x86_64')
url="http://home.earthlink.net/~k_sheff/sw/e2tools/"
license=('GPL')
depends=('e2fsprogs')
options=(!buildflags)
source=(http://home.earthlink.net/~k_sheff/sw/e2tools/$pkgname-$pkgver.tar.gz
        e2tools-fedora-fixes.patch
        e2tools-printf-lld-64bit.patch
        e2cp.1
        e2ln.1
        e2ls.1
        e2mkdir.1
        e2mv.1
        e2rm.1
        e2tail.1
        e2tools.7)
md5sums=('skip'
         'skip'
         'skip'
         'skip'
         'skip'
         'skip'
         'skip'
         'skip'
         'skip'
         'skip'
         'skip')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/e2tools-fedora-fixes.patch"
  patch -p1 < "${srcdir}/e2tools-printf-lld-64bit.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make CPPFLAGS="-Wall -Werror"
}

package() {
  install -dm 0755 "${pkgdir}/usr/share/man/man1"
  install -dm 0755 "${pkgdir}/usr/share/man/man7"
  install -pm 0644 \
    e2cp.1 \
    e2ln.1 \
    e2ls.1 \
    e2mkdir.1 \
    e2mv.1 \
    e2rm.1 \
    e2tail.1 \
    "${pkgdir}/usr/share/man/man1"
  install -pm 0644 e2tools.7 "${pkgdir}/usr/share/man/man7"

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
