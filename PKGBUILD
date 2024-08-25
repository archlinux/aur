pkgname=freqtweak-git
pkgver=r15.d420533
pkgrel=3
pkgdesc="Audio Effect Processor and Spectrum Analyzer"
arch=('i686' 'x86_64')
depends=('wxwidgets-gtk3' 'fftw' 'jack' 'libsigcpp1.2' 'libsigc++')
provides=('freqtweak')
makedepends=('git')
conflicts=(${pkgname%-git})
url="https://github.com/essej/freqtweak"
source=("$pkgname::git+$url.git" 'utf8ports.patch')
sha256sums=('SKIP'
            '625a2acdc17c5e287c024e4c027900e868ff3f176bf9f8869b0a1248058894b6')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	patch -Np1 < ../utf8ports.patch
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
