# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=numix-frost-themes-git
pkgver=latest
pkgrel=1
pkgdesc="A modern flat theme with a combination of light and dark elements - Antergos Edition"
arch=('any')
url="https://numixproject.github.io/"
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('gdk-pixbuf2' 'glib2' 'ruby-sass')
provides=('numix-frost-themes')
conflicts=('numix-frost-themes')
source=("git+https://github.com/Antergos/Numix-Frost.git"
        "Numix-Frost-Light::git+https://github.com/Antergos/Numix-Frost.git#branch=numix-frost-light")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/Numix-Frost"
  git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/Numix-Frost"
  make

  cd "$srcdir/Numix-Frost-Light"
  make
}

package() {
  cd "$srcdir/Numix-Frost"
  scripts/utils.sh install "$srcdir/Numix-Frost/" "$pkgdir/usr/share/themes"

  cd "$srcdir/Numix-Frost-Light"
  scripts/utils.sh "$pkgdir/usr/share/themes/Numix-Frost-Light"
}
