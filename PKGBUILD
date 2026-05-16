# Maintainer: unatried <unatried@unatried.com>
pkgname=hdrop-git
pkgver=r133.ae05f71
pkgrel=1
pkgdesc="Emulate tdrop in Hyprland"
arch=('any')
url="https://github.com/Schweber/hdrop"
license=("AGPL-3.0")
provides=("hdrop")
conflicts=("hdrop")
depends=(
	"libnotify"
	"jq"
	"bash"
	"gawk"
	"hyprland"
)
makedepends=(
	"git"
	# "make" # not using the makefile because it doesn't do anything major
    "scdoc"
)
source=("git+https://github.com/Schweber/hdrop.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/hdrop"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/hdrop"
    scdoc < hdrop.1.scd > hdrop.1
}

package() {
	cd "$srcdir/hdrop"
    install -Dm 644 hdrop.1 "$pkgdir/usr/share/man/man1/hdrop.1"
    install -Dm 755 hdrop "$pkgdir/usr/bin/hdrop"
}
