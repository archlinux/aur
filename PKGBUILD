# Maintainer: ssf <punx69 at gmx dot net>

pkgname=ivy-icon-theme-git
pkgver=r8.eb6b411
pkgrel=1
pkgdesc="A very minimalistic tango like icon theme"
arch=("any")
url="http://sixsixfive.deviantart.com/art/Ivy-371216510"
license=("CCPL:cc-by-sa-4.0")
depends=('hicolor-icon-theme')
optdepends=('tango-icon-theme: for missing icons' 'glare-themes-git: the recommend gui theme' 'glare-theme-misc: the recommend gui theme part 2')
makedepends=('git' 'optipng' 'inkscape')
source=(Ivy::git+https://github.com/sixsixfive/ivy)

pkgver() {
 cd "$srcdir/Ivy"
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd $srcdir/Ivy
  sh x-build.sh
}

package() {
	cd "$srcdir"/Ivy
	mkdir -p "$pkgdir"/usr/share/icons/Ivy
	rm -r src
	cp -R $srcdir/Ivy/ "$pkgdir"/usr/share/icons/
}
md5sums=('SKIP')
