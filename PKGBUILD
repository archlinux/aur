# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: mentallaxative <laxatives@gmail.com>

pkgname=rubyroom
pkgver=0.4
pkgrel=3
pkgdesc='Ruby clone of the Whiteroom full-screen text editor'
arch=('x86_64' 'i686')
url='http://rubyroom.rubyforge.org/'
license=('GPL2')
depends=('ruby-gtk2')
makdepends=('imagemagick' 'gendesk')
optdepends=('fortune-mod: for poetic inspiration')
source=("git://github.com/xyproto/rubyroom.git#tag=$pkgver"
        "http://rubyroom.rubyforge.org/rubyroom.png")
md5sums=('SKIP'
         '9a1fe6c9d67679c0d4dbbdf78a233cba')

prepare() {
  convert "$pkgname.png" -crop 48x48+110+80 icon.png
  gendesk -f --pkgname="$pkgname" --pkgdesc="You, your text and yourself" \
    --categories "Office;" --name='RubyRoom'
}

package() {
  install -Dm755 "$pkgname/$pkgname.rb" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
