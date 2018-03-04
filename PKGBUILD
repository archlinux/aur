# Maintainer: courk <courk at courk dot fr>
pkgname=kaitai-struct-compiler
pkgver=0.8
pkgrel=1
pkgdesc="Kaitai Struct Compiler: Compiler for the Kaitai declarative binary format parsing language"
arch=(any)
url="http://kaitai.io/"
license=('GPL3')
depends=("java-runtime")
optdepends=()
source=("$pkgname-$pkgver.zip::https://bintray.com/kaitai-io/universal/download_file?file_path=$pkgver%2F$pkgname-$pkgver.zip" "01-fix_lib_dir.patch")
sha1sums=("be72b5bfabd1f54a7ed5311d35dffca17d034708"
          "e56da0a1c29e23802786e6811c9ee5652174d7c3")

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/01-fix_lib_dir.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/lib/"
  for f in *.jar
  do
    install -D -m 644 "$f" "$pkgdir/usr/share/java/$pkgname/$f"
  done
  install -D -m 755 "$srcdir/$pkgname-$pkgver/bin/kaitai-struct-compiler" "$pkgdir/usr/bin/kaitai-struct-compiler"
}

# vim:set ts=2 sw=2 et:
