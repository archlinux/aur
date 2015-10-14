# See AUR interface to contact current maintainer.

# Read http://thelinuxrain.com/articles/memo-note-taking-unix-style
# for some tips on how to use this.

pkgname=memo-notes
_pkgname=${pkgname%%-notes}
pkgver=1.6
pkgrel=1
pkgdesc="memo: A CLI note taking application."
arch=('i686' 'x86_64')
url="http://www.getmemo.org/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nrosvall/memo/archive/v${pkgver}.tar.gz"
    "http://www.byteptr.com/fileformat.html")
sha256sums=('f9336524f038c0f11f5a82fe6cf6bf438e959a13f3bff973f064731789da5e62'
            '1447ef9efe397256d913f0146f0979265a1e12fa126bbd5b995e3e332ffefa21')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i -e 's/CFLAGS=/CFLAGS+=/' \
    -e 's#\(PREFIX=\)/usr/local#&/usr#' \
    Makefile
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

package () {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"
  #mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"

  install -m755 "$srcdir/$_pkgname-$pkgver"/memo "$pkgdir"/usr/bin
  install -m644 "$srcdir/$_pkgname-$pkgver"/memo.1 "$pkgdir"/usr/share/man/man1
  install -m644 "$srcdir/$_pkgname-$pkgver"/README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$_pkgname-$pkgver"/NEWS "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir"/fileformat.html "$pkgdir"/usr/share/doc/"$pkgname"
}
