# Maintainer: Leia <waste at mrtino dot eu>

pkgname=badwolf
pkgver=1.2.0
pkgrel=1
pkgdesc="A minimalist and privacy-oriented WebKit browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
#makedepends=('clang') # if you want to use clang instead of gcc, decomment this line and change CC=gcc to CC=clang in the build section
depends=('webkit2gtk')
source=("https://hacktivis.me/releases/$pkgname-$pkgver.tar.gz"
	"LICENSE")
sha512sums=('ccf0eb25630438ba783ae7e6d30b0c516290966199bbe36f76b22f2091c3a2940676ee0fb0a5cf46a9cb258e7979084d6f34662f7252c1b37ec0cee7c9958fb0'
            '9a3b68429fc2267d596e08671330cc81f6d00ac7217a7a3991ebb583823a13e323108b514f5ec672c0982844ec581d9fed28dfede8fd92976b41d46b2924e140')
install=badwolf.install

#prepare() {
#  cd "$pkgname-${pkgver//_/-}"
#  # In order to be compliant with Arch Linux directory guidelines
#  patch -p1 -i "$srcdir/arch.patch"
#}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
