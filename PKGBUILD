# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=dovecot-fts-flatcurve-git
_pkgname=dovecot-fts-flatcurve
pkgver=r433.8b530f5
pkgrel=3
pkgdesc="Dovecot FTS Flatcurve plugin (Xapian)"
arch=('x86_64')
url="https://github.com/slusarz/dovecot-fts-flatcurve"
license=('LGPL2.1')
depends=("dovecot-with-stemmer>=2.3.0" "dovecot-with-stemmer<2.4.0" 'icu' 'xapian-core')
install="$_pkgname.install"
source=("git+https://github.com/slusarz/$_pkgname.git"
        "$_pkgname.install")
b2sums=('SKIP'
        '8438841f8dfeb64da7f88452bb9d689dc72cb10233e4450e9dd538197956bb90054370078aeb72cd14102c9a467909a35b84ac568f1df3925cd07deb5edc8a5f')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-dovecot=/usr/lib/dovecot

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
