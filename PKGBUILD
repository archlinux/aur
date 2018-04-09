  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
pkgname=extraterm
pkgver=0.33.0
pkgrel=1
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("i686" "x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
source_i686=("$url/releases/download/v$pkgver/extraterm-$pkgver-linux-ia32.zip")
source_x86_64=("$url/releases/download/v$pkgver/extraterm-$pkgver-linux-x64.zip")
sha256sums_i686=('c47f2a42d14e1ac82b24dc836e3d9549e98fc165b866bc5698247502472d4883')
sha256sums_x86_64=('d04161dd14b8195d01ecaaad4b3fc9e9d6bbba0f12c71679bb639b99cf89e717')

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
  install -Dm644 $pkgdir/opt/$pkgname/resources/app/extraterm/resources/logo/extraterm_main_logo.svg $pkgdir/$_icon_dir/scalable/apps/$pkgname.svg

   install -Dm644 $pkgdir/opt/$pkgname/resources/app/extraterm/resources/logo/extraterm_small_logo_256x256.png  $pkgdir/$_icon_dir/256x256/apps/$pkgname.png

  msg2 "  -> Installing .desktop file..."
  install -Dm644 $pkgdir/opt/$pkgname/resources/app/extraterm/resources/extraterm.desktop $pkgdir/usr/share/applications/extraterm.desktop

  msg2 "  -> Installing license..."
  install -Dm755 $pkgdir/opt/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/copyright
}
