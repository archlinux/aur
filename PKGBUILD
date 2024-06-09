# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=refind-theme-catppuccin-git
pkgver=r10.ff0b593
pkgrel=1
pkgdesc="Catppuccin - Soothing pastel theme for rEFInd"
arch=('any')
url="https://github.com/catppuccin/refind"
license=('MIT')
depends=('refind')
makedepends=('git')
source=("${pkgname}::git+https://github.com/catppuccin/refind.git")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	_theme_dir="usr/share/refind/themes/catppuccin"

	install -D -m0644 -t "${pkgdir}/${_theme_dir}/" *.conf
	find assets -type f -iname *.png -exec install -D -m0644 {} "${pkgdir}/${_theme_dir}/{}" \;

	# docs
	install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
