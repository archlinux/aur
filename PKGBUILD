# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Contributor: Doommsatic <keniscoolu@gmail.com>
pkgname=khinsider-git
pkgver=r77.b1683fb
pkgrel=1
pkgdesc="A script for mass downloads from downloads.khinsider.com"
arch=('any')
url="https://github.com/obskyr/khinsider"
license=('unknown')
depends=('python' 'python-beautifulsoup4' 'python-requests')
makedepends=('git')
source=('git+https://github.com/obskyr/khinsider.git' "010-disablepip.patch")
sha256sums=('SKIP' '0f3aa4c853f592b1fe7baa38e3d2d16fa1adc2f45e8cfd7461320b63907e0086')
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
