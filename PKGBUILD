# Maintainer: RiCON <wiiaboo@gmail.com>
pkgdesc='Plex Absolute Series Scanner'
pkgname=plex-ass-scanner-git
pkgver=r1043.9d24e60
pkgrel=1
depends=('plex-media-server')
arch=('x86_64' 'i686')
url='https://github.com/ZeroQI/Absolute-Series-Scanner'
license=('GPL3')
source=(
"${pkgname}::git+${url}"
)
sha512sums=('SKIP')

pkgver () {
	cd "${srcdir}"
	(
		set -o pipefail
        cd $pkgname
		printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
	)
}

package () {
	cd "${srcdir}"

  #https://wiki.archlinux.org/index.php/plex#Plugins
	plex_main_folder="${pkgdir}/var/lib/plex/Plex Media Server"

	scanners_dir="${plex_main_folder}/Scanners/Series"
	install -d "$scanners_dir"
	cp -f $pkgname/Scanners/Series/"Absolute Series Scanner.py" "$scanners_dir"/
}
