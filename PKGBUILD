# Maintainer: Mathilde <github.com/Mathilde411>
# Maintainer: Monax (SMNX) <github.com/sleepy-monax>

pkgname="paper-muncher-git"
pkgver=0.2.2
provides=("paper-muncher")
conflicts=("paper-muncher")
pkgrel=1
pkgdesc="Convert web pages (HTML, XHTML, or SVG) into printable or viewable documents like PDFs or images."
arch=("any")
url="https://odoo.github.io/paper-muncher"
license=("LGPL-3.0-or-later")
depends=("sdl3" "liburing" "libseccomp")
makedepends=("base-devel" "git" "ninja" "llvm" "clang" "cutekit" "jq")
source=("paper-muncher::git+https://github.com/odoo/paper-muncher.git")
md5sums=("SKIP")

pkgver() {
    cd paper-muncher
    jq -r '.version' project.json | sed "s/^v//"
}

build() {
	cd paper-muncher
	ck build --release --prefix="/usr" paper-muncher
}

check() {
	cd paper-muncher
	ck test --release --prefix="/usr"
}

package() {
	cd paper-muncher
	ck package --release --prefix="/usr" --sysroot="$pkgdir" paper-muncher
}