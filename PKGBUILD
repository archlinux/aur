# Maintainer: Jon Gjengset <jon@thesquareplanet.com>

pkgname=alacritty-terminfo-git
pkgver=0.1.0.525.g8776b7e
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Terminfo files for the alacritty terminal emulator"
url="https://github.com/jwilm/alacritty"
license=('Apache-2.0')
makedepends=('git')
source=("$pkgname::git+https://github.com/jwilm/alacritty.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.%s.g%s" \
    "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2)"\
    "$(git rev-list --count HEAD)" \
    "$(git describe --always)"
}

package() {
	cd "$srcdir/$pkgname"
  install -dm 755 "$pkgdir/usr/share/terminfo/a/"
  cp alacritty.info "$pkgdir/usr/share/terminfo/a/alacritty"
  cp alacritty.info "$pkgdir/usr/share/terminfo/a/alacritty-256color"
}

# vim:set ts=2 sw=2 et:
