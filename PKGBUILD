# Maintainer: Rodolpheh <houdas.rodolphe@gmail.com>

pkgname=lesspass-desktop-git
_gitname=lesspass
pkgver=r1815.495e8b3
pkgrel=1
pkgdesc="LessPass - desktop version (deprecated)"
arch=('any')
url="https://github.com/lesspass/lesspass.git"
license=('GPL3')
depends=('npm' 'hicolor-icon-theme')
makedepends=('git')
provides=('lesspass-desktop')
conflicts=('lesspass-desktop')
options=(!emptydirs)
source=("git://github.com/lesspass/lesspass.git#commit=495e8b3323cb3a7f24dce03e4d01158affa8ccf7"
	"lesspass-desktop.desktop"
	"lesspass.sh")
sha256sums=("SKIP"
	"5b7fe2b9640d2b623cb58bfcf97d1f8566d7297238234b1b02a3353bd43f8fa8"
	"83b2ea4e48956b4f04984442161e236feb9e3e2f1801061dcbaeef9c9c06d445")

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"

	for i in 16 32 128 256 512; do
		install -Dm644 "${srcdir}/${_gitname}"/desktop/images/icon.iconset/icon_${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/lesspass.png
	done
	install -Dm644 "${srcdir}"/lesspass-desktop.desktop "${pkgdir}"/usr/share/applications/lesspass.desktop
	install -Dm755 "${srcdir}"/lesspass.sh "${pkgdir}"/usr/bin/lesspass

	echo `pwd`

	cp -dpr --no-preserve=ownership "${_gitname}/desktop" "${pkgdir}"/usr/share/lesspass
}
