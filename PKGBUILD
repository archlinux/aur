# Maintainer: Leia <waste at mrtino dot eu>

pkgname=badwolf
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimalist and privacy-oriented WebKit browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'pentium4' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
license=('BSD')
depends=('webkit2gtk')
source=("https://hacktivis.me/releases/badwolf-$pkgver.tar.gz"
	"https://hacktivis.me/releases/badwolf-$pkgver.tar.gz.sig"
	"arch.patch"
	"LICENSE")
sha512sums=('572e1c18223ded5989da9c47e42c9dcbf66903e38b672e33b098cc3f84965d9da8e0a8b71e5ec88f17879c8d2f931d9625ca26a9c5ae81cc925d62fbf2abd4f1'
            'SKIP'
            '96511e3e3f2a9bd6db4bf5b26bf3ccecd8de0cbebfe492d29290af2dc94187d5dcc6c3b8c7dec6bab24b4aa05c45f1d5f964791071fc53f457d2f5944b64fe02'
            'cee933ab08b1e05e526ddb7ee4f2e3243ebe27614e713201439e14432ce76a4eb009a96a36d666521a96661c481437d8393f4cd2f88acea138702784ce14e883')
validpgpkeys=(DDC9237C14CF6F4DD847F6B390D93ACCFEFF61AE)
install=badwolf.install

prepare() {
  cd "$pkgname-$pkgver"
  # In order to be compliant with Arch Linux directory guidelines
  patch -p1 -i "$srcdir/arch.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # install -Dm644 badwolf.desktop "$pkgdir/usr/share/applications/badwolf.desktop"
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

