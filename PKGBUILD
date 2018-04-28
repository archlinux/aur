# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lolilolicon #<moc.liamg@nocilolilol>.reverse

pkgname=libutf8proc-julia
pkgver=2.1.1
pkgrel=2
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
arch=('x86_64' 'i686')
url='https://julialang.org/utf8proc/'
license=('custom')
depends=('glibc')
makedepends=('git')
conflicts=('libutf8proc')
replaces=('libutf8proc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/JuliaLang/utf8proc/archive/v$pkgver.tar.gz"
        'libutf8proc.pc.in')
sha256sums=('27702f369f3545144470b277cd8369a7997ba4292a48a28be154c3aff28bd7b2'
            'b5119a9ed25b6a14cb49d496559f35bd5fc94f07a9435e6469f0d9338a8879d8')

build() {
  sed "s#@VERSION@#$pkgver#" libutf8proc.pc.in > libutf8proc.pc
  cd utf8proc-$pkgver
  make
}

package() {
  cd utf8proc-$pkgver

  make install prefix=/usr DESTDIR="$pkgdir"

  install -Dm644 ../libutf8proc.pc "$pkgdir/usr/lib/pkgconfig/libutf8proc.pc"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
