# Maintainer: PharmaRacist
pkgname=noon-xp-icons
pkgver=r33.24e95ad
pkgrel=1
pkgdesc="B00merang-Artwork icon theme packaged for Noon Project"
arch=('any')
url="https://github.com/B00merang-Artwork/Windows-XP"
license=('GPL3')
depends=('gtk-update-icon-cache')
install=noon-xp-icons.install
source=("$pkgname::git+https://github.com/B00merang-Artwork/Windows-XP.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  # Install icon theme to /usr/share/icons
  install -dm755 "$pkgdir/usr/share/icons"
  cp -r Windows-XP "$pkgdir/usr/share/icons/noon-xp"

  # Install license if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Install README if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
