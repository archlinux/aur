pkgname=freqtweak-git
pkgver=r15.d420533
pkgrel=2
pkgdesc="Audio Effect Processor and Spectrum Analyzer"
arch=('i686' 'x86_64')
depends=('wxgtk' 'fftw' 'jack' 'libsigcpp1.2')
conflicts=(${pkgname%-git})
url="https://github.com/essej/freqtweak"
source=($pkgname::git+"$url".git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh && ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
