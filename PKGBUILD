# Maintainer: Aleksey Stepanov <blueingreen@bluig.space>

_pkgname=jinsp
pkgname="${_pkgname}-git"
pkgver=r56.19cff34
pkgrel=1
pkgdesc='Visually inspect JSON data from the terminal.'
arch=('x86_64')
url="https://github.com/simeonkr/jinsp"
license=('MIT')
depends=('glibc')
makedepends=('make' 'git')
source=("${_pkgname}::git+https://github.com/simeonkr/jinsp")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd "${_pkgname}"

	make

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
