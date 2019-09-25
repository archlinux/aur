pkgname='generic-macro-deck'
pkgver=1.0.0
pkgrel=1
pkgdesc='Turn any keyboard into a macro board'
arch=('x86_64')
url='https://gitlab.com/ArisuOngaku/genericmacrodeck'
license=('MIT')
source=('git://github.com/ArisuOngaku/generic_macro_deck.git'
  'generic-macro-deck'
  'generic-macro-deck.desktop')
md5sums=('SKIP' 'SKIP' 'SKIP')
provides=('generic-macro-deck')
conflicts=('generic-macro-deck')
depends=('xorg-xinput')
makedepends=('electron' 'yarn' 'npm')

prepare() {
  cd "$srcdir/generic_macro_deck" || exit 1
  yarn install
}

pkgver() {
  cd "$srcdir/generic_macro_deck" || exit 1
  npm ls $pkgname | head -n 1 | cut -d " " -f 1 | cut -d "@" -f 2
}

build() {
  cd "$srcdir/generic_macro_deck" || exit 1
  yarn build-arch
}

package() {
  install -Dm644 "$srcdir/generic_macro_deck/LICENSE" "$pkgdir/usr/share/licenses/generic_macro_deck/LICENSE"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/generic_macro_deck/resources/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/generic_macro_deck/dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}
