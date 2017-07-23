# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=extraterm
pkgver=0.26.0
pkgrel=1
pkgdesc="The swiss army chainsaw of terminal emulators . "
arch=("i686" "x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
source_i686=("$url/releases/download/v$pkgver/extraterm-$pkgver-linux-ia32.zip")
source_x86_64=("$url/releases/download/v$pkgver/extraterm-$pkgver-linux-x64.zip")
sha256sums_i686=('460b4c1647527048a9247867a5705e0958720dc341484f40f1d976852906fc01')
sha256sums_x86_64=('ffcf423a59c5813bb987a1df897fe69d55342ed2085bdeebd8f6e494186aa97c')

prepare(){
rm -rf "$srcdir/$pkgname-$pkgver"
mv "$srcdir/$pkgname-$pkgver-linux-x64" "$srcdir/$pkgname-$pkgver"
}
package() {
  cd $srcdir

  msg2 "  -> Installing program..."

  install -d $pkgdir/opt
  install -d $pkgdir/opt/$pkgname

  install -d $pkgdir/usr/bin
  cp -r "$srcdir/$pkgname-$pkgver"/* "$pkgdir/opt/$pkgname"
  ln -s /opt/extraterm/extraterm $pkgdir/usr/bin/$_pkgname

 # msg2 "  -> Installing icons..."
  local _icon_dir="usr/share/icons/hicolor"
  install -Dm644 $pkgdir/opt/$pkgname/resources/app/src/logo/extraterm_small_logo.svg $pkgdir/$_icon_dir/scalable/apps/$pkgname.svg

   install -Dm644 $pkgdir/opt/$pkgname/resources/app/src/logo/extraterm_small_logo_256x256.png  $pkgdir/$_icon_dir/256x256/apps/$pkgname.png

  msg2 "  -> Installing .desktop file..."
  install -Dm644 $pkgdir/opt/$pkgname/resources/app/src/extraterm.desktop $pkgdir/usr/share/applications/extraterm.desktop

  msg2 "  -> Installing license..."
  install -Dm755 $pkgdir/opt/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/copyright
}
