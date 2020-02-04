# Maintainer: Leia <waste at mrtino dot eu>

pkgname=badwolf
pkgver=0.5.0_rc.1
pkgrel=1
pkgdesc="A minimalist and privacy-oriented WebKit browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'pentium4' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
license=('BSD')
#makedepends=('clang') # if you want to use clang instead of gcc, decomment this line and change CC=gcc to CC=clang in the build section
depends=('webkit2gtk')
source=("https://hacktivis.me/releases/$pkgname-${pkgver//_/-}.tar.gz"
	"https://hacktivis.me/releases/$pkgname-${pkgver//_/-}.tar.gz.sig"
	"arch.patch"
	"LICENSE")
sha512sums=('5c90e50feea0c94487c38a84b3245672855547ce30abaf97d78546437213e8646d8a3aa9c131eb23ab389e7a0f5eb51c04a071b0e85d86800240a383fe0c7b9d'
            'SKIP'
            '1b4ecfe1858378268dc10c60da2891ec83dd2af0df42c72eaf2eb94ec49ffd7243ac6258ade040e78b64082265f8a65515ee0ba38b1cad1c21f6287c048df008'
            'cee933ab08b1e05e526ddb7ee4f2e3243ebe27614e713201439e14432ce76a4eb009a96a36d666521a96661c481437d8393f4cd2f88acea138702784ce14e883')
validpgpkeys=(DDC9237C14CF6F4DD847F6B390D93ACCFEFF61AE)
install=badwolf.install

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  # In order to be compliant with Arch Linux directory guidelines
  patch -p1 -i "$srcdir/arch.patch"
}

build() {
  cd "$pkgname-${pkgver//_/-}"
  make CC=gcc
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # install -Dm644 badwolf.desktop "$pkgdir/usr/share/applications/badwolf.desktop"
  cd "$pkgname-${pkgver//_/-}"
  make DESTDIR="$pkgdir/" install
}

