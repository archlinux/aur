# Maintainer: James Smith <jslonescout AT icloud DOT com>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=laternamagica.app
_pkgname=LaternaMagica 
pkgrel=3
pkgver=0.5
pkgdesc="An image viewer and slideshow application."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.nongnu.org/gap/laternamagica/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'desktop-file-utils')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('3afd9345a4c046bb24e6f4c7b562cc32dc6a06415bc57d189ffb7cf0510ce8e0')

build() {
  cd "$_pkgname-$pkgver"
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
