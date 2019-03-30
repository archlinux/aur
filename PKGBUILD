# Maintainer: Phil Hoffmann <phil dot hoffmann at zoho dot eu>

pkgname=gm-companion
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool for rpg gamemasters."
url="https://gm-companion.github.io/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('qt5-declarative>=5.10.0', 'qt5-graphicaleffects>=5.10.0', 'qt5-multimedia>=5.10.0', 'qt5-networkauth>=5.10.0', 'qt5-quickcontrols2>=5.10.0', 'poppler-qt5')
makedepends=('gendesk')
conflicts=('gm-companion-git')
source=("https://github.com/PhilInTheGaps/GM-Companion/releases/download/${pkgver}/source_with_submodules.tar.xz" "https://raw.githubusercontent.com/PhilInTheGaps/GM-Companion/ubuntu-build/data/share/gm-companion/icon256.png")
md5sums=('83e5a514cabefcb33495cd4b293479e5'
         '877a226689a5edaee3ecfdaf767ded9d')

prepare() {
  gendesk -n -f --name='GM-Companion' --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
  cd "${srcdir}"
  qmake
  make PREFIX=/usr
  
}

package() {
  # Install main binary
  cd "${srcdir}"
  make INSTALL_ROOT="$pkgdir" install 
  
  # Desktop Entry
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  # Icon
  install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

