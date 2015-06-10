# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lolilolicon #<moc.liamg@nocilolilol>.reverse

pkgname=libutf8proc-julia
pkgver=1.1.6
pkgrel=1
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
arch=('x86_64' 'i686')
url='http://julialang.org/utf8proc/'
license=('custom')
makedepends=('git')
conflicts=('libutf8proc')
replaces=('libutf8proc')
source=("git://github.com/JuliaLang/utf8proc.git#tag=v$pkgver"
        'utf8proc-1.1.6-buildflags.patch'
        'utf8proc-1.1.6-soname.patch'
        'libutf8proc.pc')
md5sums=('SKIP'
         'e19f11bf48fd814f6b355df8de37385b'
         '7801006b616145f3f8ebf1b4a668509a'
         'd33f454a3b7e8325390697d11d58fe80')

prepare() {
  cd utf8proc

  # Added by lolilolicon, not sure if still needed
  patch -Np1 -i "../utf8proc-1.1.6-buildflags.patch"
  patch -Np1 -i "../utf8proc-1.1.6-soname.patch"
}

build() {
  make -C utf8proc libutf8proc.so
}

package() {
  cd utf8proc

  install -Dm755 libutf8proc.so "$pkgdir/usr/lib/libutf8proc.so"
  install -Dm644 utf8proc.h "$pkgdir/usr/include/$pkgname/utf8proc.h"
  install -Dm644 ../libutf8proc.pc "$pkgdir/usr/lib/pkgconfig/libutf8proc.pc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
