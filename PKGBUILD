# Maintainer: Elisamuel Resto <sam@samresto.dev>

pkgname=dovecot-fts-flatcurve
pkgver=r351.7bbbdaf
pkgrel=1
pkgdesc="Dovecot FTS Flatcurve plugin (Xapian)"
arch=('x86_64')
url="https://github.com/slusarz/dovecot-fts-flatcurve"
license=('LGPL2.1')
depends=("dovecot>=2.3.0" "dovecot<2.4.0" 'icu' 'xapian-core')
install="$pkgname.install"
sha256sums=('SKIP')

source=("git+https://github.com/slusarz/$pkgname.git"
        "$pkgname.install")

sha256sums=('SKIP'
            '4bdbf8780b5c7ce2040a08f175195ec2cdab536407e0d3454fbd6f2eb1101cc0')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-dovecot=/usr/lib/dovecot

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
