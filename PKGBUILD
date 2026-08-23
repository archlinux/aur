# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Contributor: Doommsatic <keniscoolu@gmail.com>
pkgname=khinsider-git
pkgver=r80.dabe218
pkgrel=1
pkgdesc="A script for mass downloads from downloads.khinsider.com"
arch=('any')
url="https://github.com/obskyr/khinsider"
license=('unknown')
depends=('python' 'python-beautifulsoup4' 'python-cloudscraper' 'python-requests')
makedepends=('git')
source=('git+https://github.com/obskyr/khinsider.git' "010-disablepip.patch")
sha256sums=('SKIP' 'b0d252e4a3643f33a1c8ac3b6436a405deff43c2066b7ade55fc2949209c97a3')
provides=('khinsider')
conflicts=('khinsider')

prepare() {
	patch -d khinsider -Np1 -i "${srcdir}/010-disablepip.patch"
}

pkgver() {
	cd "$srcdir/khinsider"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/khinsider"
	install -Dm755 khinsider.py "${pkgdir}/usr/bin/khinsider"
	install -Dm644 readme.md "${pkgdir}/usr/share/doc/khinsider/readme.md"
}
