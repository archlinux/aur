  # Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=extraterm
pkgver=0.29.1
pkgrel=2
pkgdesc="The swiss army chainsaw of terminal emulators . "
arch=("i686" "x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
source_i686=("$url/releases/download/v$pkgver/extraterm-$pkgver-linux-ia32.zip")
source_x86_64=("$url/releases/download/v$pkgver/extraterm-$pkgver-linux-x64.zip")
sha256sums_i686=('ec1b81547ed8c0e83409624c88b471819a9fc9c27252dc20d796d3ef55c5162d')
sha256sums_x86_64=('0cdce9e4d68a659d4d89f87ff0e46b7204a145148a17cc8e7bebd0ae03afe690')

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

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
     #!/usr/bin/bash
    /opt/extraterm/extraterm
END

  msg2 "  -> Installing icons..."
  local _icon_dir="usr/share/icons/hicolor"
  install -Dm644 $pkgdir/opt/$pkgname/resources/app/src/logo/extraterm_small_logo.svg $pkgdir/$_icon_dir/scalable/apps/$pkgname.svg

   install -Dm644 $pkgdir/opt/$pkgname/resources/app/src/logo/extraterm_small_logo_256x256.png  $pkgdir/$_icon_dir/256x256/apps/$pkgname.png

  msg2 "  -> Installing .desktop file..."
  install -Dm644 $pkgdir/opt/$pkgname/resources/app/src/extraterm.desktop $pkgdir/usr/share/applications/extraterm.desktop

  msg2 "  -> Installing license..."
  install -Dm755 $pkgdir/opt/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/copyright
}
