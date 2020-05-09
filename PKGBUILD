# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='ansible-aur'
pkgname="${_pkgname}-git"
pkgver=0.25.r2.gde92aa8
pkgrel=1
pkgdesc='ansible module to install packages from AUR'
arch=('any')
url='https://github.com/kewlfft/ansible-aur'
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/kewlfft/${_pkgname}.git?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub (web-flow commit signing)
)


pkgver() {
	cd "${_pkgname}"
	git describe --tags --long | sed '
	    s/^v//
	    s/\([^-]*-g\)/r\1/
	    y/-/./
	'
}

package() {
	cd "${_pkgname}"
	install -Dm644 README.md	"$pkgdir/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 library/aur.py	"$pkgdir/usr/share/ansible/plugins/modules/aur.py"
}
