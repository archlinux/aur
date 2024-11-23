# Maintainer: Andrew Glaze <candy@candy123.moe>
_pkgbasename=comlink
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r223.46229b5
pkgdesc="An experimental IRC client"
arch=('x86_64')
url="https://github.com/rockorager/${_pkgbasename}"
provides=('comlink')
conflicts=('comlink')
license=('MIT')
depends=('glibc')
makedepends=('git' 'zig')
source=("git+https://github.com/rockorager/${_pkgbasename}.git")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${_pkgbasename}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgbasename}"

        # Readme uses ReleaseSafe in the build instructions
        # using ReleaseFast may not be safe
        zig build -Doptimize=ReleaseFast
}

package() {
	cd "$srcdir/${_pkgbasename}"

        zig build -p "${pkgdir}"/usr -Doptimize=ReleaseFast
        install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}


