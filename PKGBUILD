# Maintainer: Daniel Maslowski <info@orangecms.org>
# Maintainer: Abraar Sameer <abraarsameer (at) proton (dot) me>

_appname=fiedka
pkgname=fiedka-bin
pkgver=1.5.2
pkgrel=2
pkgdesc="Fiedka the Firmware Editor"
arch=('x86_64')
url="https://fiedka.app"
license=('GPL3')
makedepends=('unzip')
provides=("${_appname}")
conflicts=("${_appname}")
install=
_dir="$_appname-linux-x64"
source=(
  "https://github.com/fiedka/$_appname/releases/download/v$pkgver/$_dir-$pkgver.zip"
  "${_appname}-art::git+https://github.com/fiedka/art"
  "${_appname}.desktop.in"
)
sha256sums=('6a4e16eb1eea3b449e74ab2dcb9c42acb6d7174c8b0b5b3d20d1d540be5c2a54'
            'SKIP'
            'f213deab0aac572189a8c68861a77136a3e519aacfe02440c8e36c1b2a2a7776')

package() {
	cd "$srcdir"

	install -dm 755 "$pkgdir/usr/bin" "$pkgdir/opt/$_appname" 
  
  cp -r "$srcdir/${_dir}"/* "$pkgdir/opt/$_appname/"
  ln -s "/opt/$_appname/$_appname" "$pkgdir/usr/bin/$_appname"
  
  install -Dm 644 "$srcdir/$_appname-art/$_appname.png" "$pkgdir/usr/share/icons/hicolor/150x150/apps/$_appname.png" 
  install -Dm 644 "$srcdir/$_appname-art/$_appname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appname.svg" 
 
  install -Dm 644 "$_appname.desktop.in" "$pkgdir/usr/share/applications/$_appname.desktop"
}
