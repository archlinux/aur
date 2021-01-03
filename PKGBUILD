# Maintainer: Ricardo Constantino <ricardo@tsu.re>
# Maintainer: Frantic1048 <archer@frantic1048.com>
pkgdesc='Plex HTTP Anidb Metadata Agent (HAMA)'
pkgname=plex-hama-git
pkgver=r1072.bb684a2
pkgrel=1
makedepends=('git')
depends=('plex-media-server' plex-ass-scanner-git)
conflicts=('plex-hama-bundle-git')
provides=('plex-hama-bundle-git')
arch=('x86_64' 'i686')
url='https://github.com/ZeroQI/Hama.bundle'
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

build () {
	:
}

package () {
	cd "${srcdir}"

    #https://wiki.archlinux.org/index.php/plex#Plugins
	plex_main_folder="${pkgdir}/var/lib/plex/Plex Media Server"

	plugins_dir="${plex_main_folder}/Plug-ins/hama.bundle"
	install -d "$plugins_dir"
	cp -r ./$pkgname/* "$plugins_dir"
}
