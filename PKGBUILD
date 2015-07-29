# Maintainer: lks <lukas cdot graetz at web cdot de>

_pkgname=links
pkgname=links1
pkgver=1.03
pkgrel=2
pkgdesc="A text WWW browser, similar to Lynx (1.x branch)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.jikos.cz/~mikulas/links/"
license=('GPL')
depends=('openssl')

source=("http://www.jikos.cz/~mikulas/links/download/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('659b2492c97a1416855d3e0f5a5f18aed5160b8a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  aclocal
  automake --add-missing
  autoreconf --force
  for file in $( ls); do
    if [ -f $file ]
      then sed -i "s|\.links|.links1|g" $file
    fi
  done
  ./configure --prefix=/usr --mandir=/usr/share/man --with-ssl

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cd "${pkgdir}"
  mv usr/bin/links usr/bin/links1
  mv usr/share/man/man1/links.1 usr/share/man/man1/links1.1
}
