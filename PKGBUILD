# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-mk-en
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium language data for the Macedonian-English translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2' 'apertium>=3.2' 'vislcg3>=0.9.7.6010')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "Makefile.in.patch")
md5sums=('46bd7cfcb16afeea7a731b574ae439d8'
         'fcedcd77d631ff01f38dcfe244e6325d'
         '44a0cf3352b887866f0e15a0eda48510')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < Makefile.in.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  export PATH="/usr/bin:${PATH}" # override /usr/local/bin
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
