# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=wl-ime-type-git
_pkgname=wl-ime-type
pkgver=r5.9b8eef023524
pkgrel=1
license=('BSD')
pkgdesc="Type text via Wayland's input-method-unstable-v2 protocol"
makedepends=("scdoc" "git")
depends=("wayland")
arch=("x86_64")
url='https://git.sr.ht/~emersion/wl-ime-type'
source=("${pkgname%-*}::git+https://git.sr.ht/~emersion/wl-ime-type")
sha1sums=('SKIP')
provides=('wl-ime-type')
conflicts=('wl-ime-type')
options=(debug !strip)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 wl-ime-type "$pkgdir/usr/bin/wl-ime-type"
	install -Dm644 wl-ime-type.1 "$pkgdir/usr/share/man/man1/wl-ime-type.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
