# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbpdf-git
pkgver=0.r91.43ca240
pkgrel=1
epoch=
pkgdesc="A small framebuffer pdf viewer, based on MuPDF."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
depends=('mupdf' 'libmupdf' 'mujs' 'poppler' 'djvulibre' 'openjpeg2')
makedepends=('git')
optdepends=('poppler' 'djvulibre')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=fbpdf-git.install
source=("$pkgname::git+git://repo.or.cz/fbpdf.git"
        'fbpdf.1'
        'LICENSE')
noextract=()
md5sums=('SKIP'
         'ae7299de0fcd8e945940b014ba335c1b'
         'ec67f29a7dec10f86ef31515ed657a91')
sha1sums=('SKIP'
          'f9a0cc6beb0e118b1116e08c5a0b91a028f8177e'
          '76a535243054e1fdd9caaa46a1571cd381d74353')
sha256sums=('SKIP'
            '157e29d7bacf906762a003271b189ca93f51c5f5cfad25e469ec4936c4d8cf5e'
            '0ea8d51c57a3a59ca57428b6fe9b47fdb1fde281fc1b095c9832872e85b09a72')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/lopenjpeg/lopenjp2/' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make LDFLAGS="-lharfbuzz" all
  make fbpdf2
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 fbpdf $pkgdir/usr/bin/fbpdf
  install -Dm755 fbpdf2 $pkgdir/usr/bin/fbpdf2
  install -Dm755 fbdjvu $pkgdir/usr/bin/fbdjvu
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 $srcdir/fbpdf.1 $pkgdir/usr/share/man/man1/fbpdf.1
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

