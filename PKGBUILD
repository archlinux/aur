# Maintainer: Kacper Kocot <kocotian@kocotian.pl>
pkgname=pacgtk-git
pkgbasename=${pkgname%-git}
pkgver=v2.0.1.r0.3bdbc94
pkgrel=1
pkgdesc="GUI wrapper for pacman"
arch=(any)
url="https://git.kocotian.pl/pacboy"
license=('GPL2')
groups=()
depends=('yad' 'pacman-contrib')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
source=('git+git://git.kocotian.pl/pacgtk.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgbasename}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgbasename}"

	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications/"

	install -Dm 755 pacgtk ${pkgdir}/usr/bin/
	install -Dm 755 pacgtk.desktop ${pkgdir}/usr/share/applications/
}
