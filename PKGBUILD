pkgname=budgie-windowshuffler-git
pkgver=r7.c2df993
pkgrel=1
pkgdesc='GUI and keyboard friendly window arranger for the budgie and mate desktop'
arch=('any')
url='https://github.com/UbuntuBudgie/window-shuffler'
license=('GPL3')
depends=('wmctrl' 'xdotool' 'python-cairo' 'python-gobject')
optdepends=('budgie-desktop: The Budgie desktop'
            'mate-desktop')
provides=('budgie-windowshuffler')
conflicts=('budgie-windowshuffler')
source=('git+https://github.com/UbuntuBudgie/window-shuffler.git')
sha256sums=('SKIP')

pkgver() {
  cd window-shuffler
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd window-shuffler
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm LICENSE
  rm README.md
  mkdir "${pkgdir}/usr/share/pixmaps/"
  cp icons/* "${pkgdir}/usr/share/pixmaps/"
  rm -rf icons
  mkdir -p "${pkgdir}/usr/share/budgie-desktop/windowshuffler/"
  cp ./* "${pkgdir}/usr/share/budgie-desktop/windowshuffler/"
}
