# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=slrn-snapshot
_pkgname=slrn
pkgver=1.0.4.5
_prever='pre1.0.4-5'
pkgrel=1
pkgdesc='An easy-to-use, text-mode, threaded Usenet/NNTP client (newsreader)'
arch=('x86_64' 'armv7h')
url='https://jedsoft.org/'
license=('GPL')
makedepends=('uudeview')
depends=('openssl' 'slang')
provides=('slrn')
conflicts=('slrn')
backup=(etc/slrnrc)
options=('!makeflags' 'docs' 'zipman')
source=("https://jedsoft.org/snapshots/${_pkgname}-${_prever}.tar.gz")
md5sums=(
  '953d88617e47a80693e6e48d07c7507e'
)
sha1sums=(
  '1cafe805e5c44eb191497321b31d9316c14a4724'
)
sha256sums=(
  '7e3f6c880a632d737e4769a2a778b7b918bff3890052078500517dbe1a223915'
)
sha512sums=(
  'f2b640e584e0e02d7a65846078448f77be0b2272f36a0dbc299578578b8e289892b72f4e9cad32fa599666c0e9f4d11af8ce83653f10f9b9ea67243abbd5af5c'
)
b2sums=(
  'e7bac8e970f67d9bf3a27ea8470ac017b97b17eafd79e8c3c77662bf35ee210b9d2010c62ea8409f5cc242b01a536ab4a203d8eae4a4b961154ffedf7c4acefd'
)

build() {
  cd "$_pkgname-$_prever" || exit 1

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-setgid-code \
    --with-slrnpull \
    --with-ssl \
    --with-uu \
    --with-uulib=/usr/lib/uudeview \
    --with-uuinc=/usr/include/uudeview \
    --enable-spoilers

  make UUDEVIEW_LIB='/usr/lib/uudeview/*.o'
}

package() {
  cd "$_pkgname-$_prever" || exit 1

  make DESTDIR="$pkgdir" install

  install -Dm0644 COPYRIGHT   "$pkgdir/licenses/$pkgname/COPYRIGHT"
  install -Dm0644 doc/slrn.rc "$pkgdir/etc/slrnrc"
}

# eof
