# Maintainer: Lxtharia <maud-lin at gmx /dot/ de>
# Maintainer: Takstaartje <takstaartje at proton /dot/ me>

pkgname=grub-theme-minegrub-world-selection-git
pkgver=r104.3e0f8ff
pkgrel=1
pkgdesc="A grub theme in the style of the Minecraft singleplayer (sp) world selection screen!"
arch=('any')
url="https://github.com/Lxtharia/minegrub-world-sel-theme"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("repo::git+${url}.git#branch=main") # Repo uses dev branch and main branch
sha256sums=('SKIP')
install=instructions.install


# Allows adjusting where the theme will be installed to
GRUB_THEME_BASEDIR="${GRUB_THEME_BASEDIR:=/boot/grub/themes/}"
GRUB_THEME_NAME="minegrub-world-selection"


pkgver() {
	cd "$srcdir/repo"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	echo ""
  echo "NOTE: the installation path of the minegrub-world-selection grub theme can be adjusted"
	echo "by setting the GRUB_THEME_BASEDIR environment variable before building this package."
	echo "Currently, it was interpreted to be '${GRUB_THEME_BASEDIR}'."
	echo ""
}

package() {
	cd "$srcdir/repo"

	# Install theme
	install -dm 0755 "${pkgdir}/${GRUB_THEME_BASEDIR}/${GRUB_THEME_NAME}"
	cp -ru minegrub-world-selection/* "${pkgdir}/${GRUB_THEME_BASEDIR}/${GRUB_THEME_NAME}"

	# Install license
	install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
