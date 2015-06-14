# Maintainer: Adrián Pérez de Castro
pkgname='vertex-icons-git'
pkgdesc='A Gnome icon theme to match the Vertex Gtk theme'
pkgver=r16.f27e47e
pkgrel=2
url='https://github.com/horst3180/Vertex-Icons/'
depends=('moka-icon-theme-git' 'faba-mono-icons-git')
arch=('any')
license='GPL'
source=("${pkgname}::git://github.com/horst3180/Vertex-Icons.git")
install="${pkgname}.install"
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	:
}

package () {
	cd "${pkgname}"
	install -dm755 "${pkgdir}/usr/share/icons/Vertex-Icons"
	for i in * ; do
		if [[ -d ${i} ]] ; then
			echo "Installing: ${i}..."
			cp -r "${i}" "${pkgdir}/usr/share/icons/Vertex-Icons"
		fi
	done
	install -Dm644 index.theme \
		"${pkgdir}/usr/share/icons/Vertex-Icons/index.theme"
}
