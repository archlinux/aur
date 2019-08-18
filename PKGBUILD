# Maintainer: Leia <waste at mrtino dot eu>

pkgname=badwolf
pkgver=0.3.0
pkgrel=1
pkgdesc="A minimalist and privacy-oriented WebKit browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'pentium4' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
license=('BSD')
depends=('webkit2gtk')
source=("https://hacktivis.me/releases/badwolf-$pkgver.tar.gz"
	"https://hacktivis.me/releases/badwolf-$pkgver.tar.gz.sig"
	"https://hacktivis.me/releases/badwolf-0.3.0_Prevent-the-statusbar-label-from-resizing-the-window.patch"
	"arch.patch"
	"badwolf.desktop"
	"LICENSE")
sha512sums=('6775fc673d3c985d2420e017bdefb0b0106c395eada04f54415e901e40779ebc427ab1b3135e1489077b9fbf5529be9e5d4d81a9b87001a55dfe6c15efa0b8c6'
            'SKIP'
            '2d201f91cd4e9462bc1e68f3d107c32d73a01a3826ab679afa6aa6473dcec68f46544c92f8de6333b53cb9712bebf6f836652d7fb52e6f2fb7511e94940036f9'
            '96511e3e3f2a9bd6db4bf5b26bf3ccecd8de0cbebfe492d29290af2dc94187d5dcc6c3b8c7dec6bab24b4aa05c45f1d5f964791071fc53f457d2f5944b64fe02'
            '8e4a0f33b2374dddb8e7a7ec2a8d7783f34e8904838a9e62a80205056719177f1c4a1b4eb5e2088ec3a495ddaf210bdf65cfccca133352583ccf94466fbf7b72'
            'cee933ab08b1e05e526ddb7ee4f2e3243ebe27614e713201439e14432ce76a4eb009a96a36d666521a96661c481437d8393f4cd2f88acea138702784ce14e883')
validpgpkeys=(DDC9237C14CF6F4DD847F6B390D93ACCFEFF61AE)
install=badwolf.install

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/badwolf-0.3.0_Prevent-the-statusbar-label-from-resizing-the-window.patch"
  # In order to be compliant with Arch Linux directory guidelines
  patch -p1 -i "$srcdir/arch.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 badwolf.desktop "$pkgdir/usr/share/applications/badwolf.desktop"
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
