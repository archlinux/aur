# Maintainer: xiretza <xiretza+aur@gmail.com>
_pkgname=ternimal
pkgname="${_pkgname}-git"
pkgver=r5.2eea4f4
pkgrel=2
pkgdesc="Simulate a lifeform in the terminal"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/p-e-w/ternimal"
license=('GPL3')
makedepends=('rust' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"

	rustc -O ternimal.rs
}

package() {
	cd "$srcdir/${_pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin/" ternimal
}
