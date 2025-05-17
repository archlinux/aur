# Maintainer: Marcel Robitaille <mail@marcelrobitaille.me>

pkgname=kicad-diff-git
pkgver=r398.eb0027a
pkgrel=1
pkgdesc=" Scripts for performing image diffs between pcbnew layout revisions Resources"
url="https://github.com/leoheck/KiCad-Diff"
license=("MIT")
arch=("x86_64")
provides=("kicad-diff")
conflicts=("kicad-diff")
makedepends=("git" "python-pip")
depends=("patch" "dos2unix" "python" "kicad" "imagemagick" "xdotool" "perl-rename" "python-pexpect" "python-wxpython")

source=("KiCad-Diff::git+https://github.com/leoheck/KiCad-Diff.git")
sha256sums=("SKIP")

package() {
	mkdir -p "$pkgdir/opt/KiCad-Diff/"
	mkdir -p "$pkgdir/usr/bin"
	cp -r . "$pkgdir/opt/"
	for bin in "kidiff" "kicad_svg_tweaks" "plot_kicad_pcb"; do
		ln -s "../../opt/KiCad-Diff/bin/$bin" "$pkgdir/usr/bin/$bin"
	done
}

pkgver() {
	cd "KiCad-Diff"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
