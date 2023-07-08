# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=enlightenment-arc-theme
pkgname=${_gitname}-git
pkgver=0.5.2.r2.g1c3bfa1
pkgrel=1
pkgdesc="A flat theme for Enlightenment"
arch=('any')
url="https://github.com/lightdot/${_gitname}"
license=('GPL3')
depends=('efl')
makedepends=('git' 'efl')
source=("git+https://github.com/lightdot/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_gitname}"
	make orig-theme
	make all
}

package() {
	install -Dm644 "${srcdir}/${_gitname}/arc.edj" "$pkgdir"/usr/share/elementary/themes/arc.edj
	install -Dm644 "${srcdir}/${_gitname}/arc-dark.edj" "$pkgdir"/usr/share/elementary/themes/arc-dark.edj
	# install -Dm644 "${srcdir}/${_gitname}/arc-darker.edj" "$pkgdir"/usr/share/elementary/themes/arc-darker.edj
}
