# Maintainer: Jake <aur2044@jklr.org>
pkgname=kaitai-struct-compiler
pkgver=0.11
pkgrel=1
pkgdesc="Kaitai Struct Compiler: Compiler for the Kaitai declarative binary format parsing language"
arch=(any)
url="http://kaitai.io/"
license=('GPL3')
depends=("java-runtime")
optdepends=()
source=("https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/$pkgver/$pkgname-$pkgver.zip"
        "01-fix_lib_dir.patch")
sha256sums=('ff89389d9dc9e770d78a24af328763cb1f8e7b31ce7766c9edf10669a060f2a2'
            'ee6c332c5b502914567988d10331c13aac917298ae193a7953ccd82223590837')

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
