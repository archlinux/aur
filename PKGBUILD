# Maintainer: Rodolpheh <houdas.rodolphe@gmail.com>

pkgname=lesspass-desktop-git
_gitname=desktop
pkgver=r60.dff0326
pkgrel=1
pkgdesc="Lesspass - desktop version"
arch=('any')
url="https://github.com/lesspass/desktop.git"
license=('GPL3')
depends=('npm' 'hicolor-icon-theme')
makedepends=('git')
provides=('lesspass-desktop')
conflicts=('lesspass-desktop')
options=(!emptydirs)
source=("git://github.com/lesspass/desktop.git"
	"lesspass-desktop.desktop"
	"lesspass.sh")
sha256sums=("SKIP"
	"da822ae7f5ed272bb3d92c6da49572ee8740a19889f798f74778d44d7a70ab96"
	"83b2ea4e48956b4f04984442161e236feb9e3e2f1801061dcbaeef9c9c06d445")

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"

	for i in 16 32 128 256 512; do
		install -Dm644 "${srcdir}"/desktop/images/icon.iconset/icon_${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/lesspass.png
	done
	install -Dm644 "${srcdir}"/lesspass-desktop.desktop "${pkgdir}"/usr/share/applications/lesspass.desktop
	install -Dm755 "${srcdir}"/lesspass.sh "${pkgdir}"/usr/bin/lesspass

	cp -dpr --no-preserve=ownership "${_gitname}" "${pkgdir}"/usr/share/lesspass
}
