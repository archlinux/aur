# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=libvss-git
pkgver=r651.b8ed8a1
pkgrel=1

pkgdesc='High level string and text processing library'
url='https://github.com/AdaCore/VSS'
arch=('any')
license=('GPL3')

makedepends=('git' 'gcc-ada' 'gprbuild')

conflicts=('libvss')

source=("git+https://github.com/AdaCore/VSS.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/VSS"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/VSS"
	make BUILD_MODE=prod
}

package() {
    cd "$srcdir/VSS"

	gprinstall -p -P gnat/vss_text.gpr -XBUILD_MODE=prod --prefix="$pkgdir/usr"
    gprinstall -p -P gnat/vss_json.gpr -XBUILD_MODE=prod --prefix="$pkgdir/usr"
}
