# Maintainer: monsoon235 <29970829+monsoon235@users.noreply.github.com>
pkgname=whitesur-kde-theme-git
_gitname=WhiteSur-kde
pkgver=r157.cf4df59
pkgrel=1
pkgdesc="MacOS Big Sur theme for KDE Plasma by https://github.com/vinceliuice (development version)"
arch=("any")
url="https://github.com/vinceliuice/${_gitname}"
license=("GPL-3.0-only")
groups=()
depends=()
optdepends=(
	"plasma-desktop: for the included Plasma theme"
	"kvantum: Kvantum theme support"
	"sddm: SDDM theme support"
	"whitesur-icon-theme: Whitesur icon theme"
	"whitesur-cursor-theme: Whitesur cursor theme"
	"whitesur-gtk-theme: Whitesur GTK theme"
)
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("${_gitname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	local sourcedir="$srcdir/${_gitname}-package"
	cp -a "$srcdir/$_gitname" "$sourcedir"
	cd "$sourcedir"
	sed -i \
		-e 's|AURORAE_DIR="/usr/share/|AURORAE_DIR="${PKGDIR}/usr/share/|' \
		-e 's|SCHEMES_DIR="/usr/share/|SCHEMES_DIR="${PKGDIR}/usr/share/|' \
		-e 's|PLASMA_DIR="/usr/share/|PLASMA_DIR="${PKGDIR}/usr/share/|' \
		-e 's|LOOKFEEL_DIR="/usr/share/|LOOKFEEL_DIR="${PKGDIR}/usr/share/|' \
		-e 's|KVANTUM_DIR="/usr/share/|KVANTUM_DIR="${PKGDIR}/usr/share/|' \
		-e 's|WALLPAPER_DIR="/usr/share/|WALLPAPER_DIR="${PKGDIR}/usr/share/|' \
		install.sh
	PKGDIR="$pkgdir" ./install.sh
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
