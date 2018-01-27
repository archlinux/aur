pkgname="eidolon-git"
_pkgname="eidolon"
pkgver=r64.6d949a8
pkgrel=1
pkgdesc="Provides a single TUI-based registry for drm-free, wine and steam games on linux, accessed through a rofi launch menu."
arch=('any')
url="https://github.com/nicohman/eidolon"
license=('GPL')
makedepends=(rust cargo)
depends=(rofi)
conflicts=(eidolon)
source=("git+https://github.com/nicohman/eidolon.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd ${_pkgname}
	cargo build --release
	install -d -m 755 ${pkgdir}/usr/bin
	cp target/release/eidolon ${pkgdir}/usr/bin/eidolon
}

