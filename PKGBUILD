# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thea Barnes <thea@tsbarnes.com>
pkgname=arch-yellow-kde-theme-git
pkgver=r5.9b76e97
pkgrel=1
pkgdesc="ArchYellow theme for KDE"
arch=('any')
url="https://www.pling.com/p/1575095"
license=('LGPL3')
depends=("arch-kde-theme-git" "sierrabreeze-kwin-decoration-git" "papirus-paleorange-icon-theme")
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
options=('!strip')
source=("ArchYellow::git+https://github.com/tsbarnes/ArchYellow.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ArchYellow"
  ( 
   set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
	cd "ArchYellow"
	mkdir -p "$pkgdir/usr/share"
	cp -drf color-schemes plasma "$pkgdir/usr/share/"
}
