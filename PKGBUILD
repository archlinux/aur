# Contributor: Fabrizio Fresco < fabrizio . fresco at gmail . com >
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Yann Pomarede < yann . pomarede at gmail dot com >
# Contributor: tee < teeaur at duck dot com >

pkgname=brutefir
pkgver=1.1.2
pkgrel=1
pkgdesc="Is a software convolution engine, a program for applying long FIR filters to multi-channel digital audio, either offline or in realtime"
arch=('i686' 'x86_64' 'armv7h' )
#url="http://www.ludd.luth.se/~torger/brutefir.html"
url="https://torger.se/anders/brutefir.html"
license=('ISC')
depends=('fftw' 'alsa-lib' 'jack' 'libpipewire' 'glibc')
source=("https://torger.se/anders/files/$pkgname-$pkgver.tar.gz")
b2sums=('b6cf187f2b4cd96d30e735cdc0208db2a181237164486f0d4f1f0bb028d32a39586b08fbe7d26aca85d823d99ccf3bda44ba536219fa37fd0efc00e9672a7cae')

build() {
  cd "${pkgname}-${pkgver}"
  sed 's@/usr/local@/usr@' -i Makefile
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
