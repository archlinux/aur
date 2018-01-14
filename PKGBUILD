#Maintainer: Alessio Tomelleri <alessio.tomelleri@gmail.com>

pkgname=tilix-themes-git
pkgver=r50.9a60818
pkgrel=4
pkgdesc="Tilix themes"
arch=('any')
url="https://github.com/storm119/Tilix-Themes"
license=('unknown')
groups=()
depends=('tilix')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('tilix-themes::git+https://github.com/storm119/Tilix-Themes.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
        install -d "$pkgdir/usr/share/tilix/schemes"
        cd "$srcdir/${pkgname%-git}"
        rm Themes-2/monokai.json #avoid conflict existing one
        install -m 644 Themes/*.json "$pkgdir/usr/share/tilix/schemes/"
        install -m 644 Themes-2/*.json "$pkgdir/usr/share/tilix/schemes/"
}
