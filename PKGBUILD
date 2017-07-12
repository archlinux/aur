# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=extraterm
pkgver=0.25.0
pkgrel=1
pkgdesc="The swiss army chainsaw of terminal emulators . "
arch=("i686" "x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
source_i686=("$url/releases/download/v0.25.0/extraterm-0.25.0-linux-ia32.zip")
source_x86_64=("$url/releases/download/v0.25.0/extraterm-0.25.0-linux-x64.zip")
sha256sums_i686=('baeee302e8b43f1274d483205b2091a4a8d4e7eb795d4cdbadbc5010a69f4bd5')
sha256sums_x86_64=('bf9c579d9a983039ea7769ed3c0415911ca9708677f6e53e3eb6fdd96edef205')

prepare(){
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
 # local _icon_dir="usr/share/icons/hicolor"
 # install -d $pkgdir/$_icon_dir/scalable/apps
 # install -Dm644 $_icon_dir/scalable/apps/$_pkgname.svg $pkgdir/$_icon_dir/scalable/apps/$_pkgname.svg
 # for _icon in "opt/brackets/appshell"*.png; do
 #   local _icon_size=${_icon##*/appshell}
 #   install -d $pkgdir/$_icon_dir/${_icon_size%.png}x${_icon_size%.png}/apps
 #   install -Dm644 $_icon $pkgdir/$_icon_dir/${_icon_size%.png}x${_icon_size%.png}/apps/$_pkgname.png
 # done

 # msg2 "  -> Installing .desktop file..."
 # install -d $pkgdir/usr/share/applications
 # sed 's/Development/Development;/' opt/$_pkgname/$_pkgname.desktop > $pkgdir/usr/share/applications/$_pkgname.desktop

  msg2 "  -> Installing license..."
  install -Dm755 $pkgdir/opt/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/copyright
}
