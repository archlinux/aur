# Maintainer: Rohan Ferris <zjrohan at gmail dot com>

pkgname="kaze-icon-theme-git"
pkgver=r37.0860f33
pkgrel=1
arch=("any")
pkgdesc="Kaze icon theme for KDE"
url="https://github.com/2O48/Kaze.git"
_reponame='Kaze'
_kazedark="${_reponame}/Kaze-dark"
_kazelight="${_reponame}/Kaze-light"
makedepends=('git')
depends=(
        "breeze"
)
provides=("kaze-icon-theme")
source=(
	"git+$url")
b2sums=('SKIP')

pkgver() {
  cd "${_reponame}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() (
        install -d "$pkgdir/usr/share/icons"
	cp -r ${_kazedark} ${pkgdir}/usr/share/icons/
	cp -r ${_kazelight} ${pkgdir}/usr/share/icons/
	find ${pkgdir}/usr -type f -exec chmod 644 {} \;
        find ${pkgdir}/usr -type d -exec chmod 755 {} \;
)
