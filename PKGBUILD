pkgname=sharpselecta-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Cross-platform music player written in .NET'
arch=('x86_64')
url='https://github.com/ghorshy/SharpSelecta'
license=('MIT')
depends=('alsa-lib' 'fontconfig' 'gcc-libs' 'glibc' 'icu' 'libice' 'libsm' 'libx11' 'openssl')
optdepends=('ffmpeg: file type conversion'
  'libpulse: output device switching through pactl'
  'glib2: moving converted originals to the trash')
provides=('sharpselecta')
conflicts=('sharpselecta')
options=('!strip' '!debug')
source=("https://github.com/ghorshy/SharpSelecta/releases/download/v$pkgver/SharpSelecta-$pkgver-linux-x64.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/ghorshy/SharpSelecta/v$pkgver/LICENSE"
  "metainfo-$pkgver.xml::https://raw.githubusercontent.com/ghorshy/SharpSelecta/v$pkgver/packaging/linux/io.github.ghorshy.SharpSelecta.metainfo.xml")
sha256sums=('7ee7f290363761335d3c742e75ba78d0e2aebae2c32e3ec1636a381dbed3a1dc'
  '769dfa6d460c266bc5e06f0346ae9c3167e7738213636963c58ea532dc04b19d'
  'e4fb14841640714bc54129239d86536388ce900d8091e2ec4954c92f040dfed2')

package() {
  cd "SharpSelecta-$pkgver-linux-x64"
  install -Dm755 sharpselecta -t "$pkgdir/usr/lib/sharpselecta/"
  install -Dm755 ./*.so -t "$pkgdir/usr/lib/sharpselecta/"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/sharpselecta/sharpselecta "$pkgdir/usr/bin/sharpselecta"
  install -Dm644 io.github.ghorshy.SharpSelecta.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 io.github.ghorshy.SharpSelecta.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$srcdir/metainfo-$pkgver.xml" "$pkgdir/usr/share/metainfo/io.github.ghorshy.SharpSelecta.metainfo.xml"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
