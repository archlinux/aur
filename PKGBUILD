# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgbase=xlesspass-git
pkgname=$pkgbase
pkgver=1.10
pkgrel=1
_gitname=XLessPass
_gittag="v${pkgver}"
pkgdesc="Allows you to use a single master key to obtain the key of your saved sessions."  
arch=('x86_64')
url='https://github.com/daltomi/XLessPass'
license=('GPL3')
depends=('gtk2')
conflicts=('xlesspass-bin')
makedepends=('git' 'lazarus-gtk2')


prepare() {
	git clone --single-branch --depth=1 --branch $_gittag "$url.git"
}

build() {
  cd $_gitname
  lazbuild --bm=Release --lazarusdir=/usr/lib/lazarus --ws=gtk2 xlesspass.lpi
}

package() {
  cd $_gitname
  install -Dm755 xlesspass "$pkgdir/usr/bin/xlesspass"
  install -Dm644 xlesspass.desktop "$pkgdir/usr/share/applications/xlesspass.desktop"
  install -Dm644 icons/key.png "$pkgdir/usr/share/pixmaps/xlesspass.png"
  mkdir -p "$pkgdir/usr/share/xlesspass/i18n"
  install -Dm644 i18n/* "$pkgdir/usr/share/xlesspass/i18n/"
}
