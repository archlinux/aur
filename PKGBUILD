# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=gaphor
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=1.2.0.r532.g357674e2
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('x86_64' 'i686')
url="https://github.com/gaphor/${_name}"
license=('Apache')
source=(
	"${_pkgname}::git+${url}.git#branch=master"
	"https://raw.githubusercontent.com/gaphor/${_name}/master/logos/org.gaphor.Gaphor.svg"
)
md5sums=('SKIP'
         '5ddbbeefd433a880ce740efb7dd47c48')
depends=(
	'python-gaphas'
	'python-typing_extensions'
	'python-generic'
)
makedepends=(
	'git'
	'python-pip'
	'gendesk'
)
optdepends=(
)
provides=(
	"${_pkgname}"
)
conflicts=(
	"${_pkgname}"
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	gendesk -f --pkgname="$_name" --pkgdesc="$pkgdesc" --categories=Development PKGBUILD
}

package() {
	cd "${srcdir}/${_pkgname}"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location .
	install -Dm644 "$srcdir/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/org.gaphor.Gaphor.svg" "$pkgdir"/usr/share/pixmaps/org.gaphor.Gaphor.svg
}

# vim: ft=PKGBUILD
