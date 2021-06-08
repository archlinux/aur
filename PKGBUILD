# Maintainer: Laurin Neff <laurin at laurinneff dot ch>

_pkgname=asus-wmi
pkgname=${_pkgname}-screenpad-dkms-git
pkgver=r17.5f45b53
pkgrel=1
pkgdesc="Variation of the asus-wmi kernel module with screenpad brightness support"
arch=(x86_64)
url="https://github.com/Plippo/${_pkgname}-screenpad"
license=('GPL2')
depends=(dkms)
makedepends=(git wget)
source=("${pkgname}::git+https://github.com/Plippo/${_pkgname}-screenpad")
sha512sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"
	sh prepare-for-current-kernel.sh
}

package() {
	install -dm755 "${pkgdir}"/usr/src/${_pkgname}-1.0/

	cp -r $pkgname/* "${pkgdir}"/usr/src/${_pkgname}-1.0/
}
