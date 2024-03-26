# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname=musyx-extract-git
pkgdesc="Sample extractor for GameCube MusyX files"

pkgver=r18.1d9e5c4
pkgrel=2

arch=(any)

url="https://github.com/Nisto/musyx-extract"
license=("LicenseRef-unknown")

depends=(python)
makedepends=(git)

provides=(musyx-extract)

source=("git+https://github.com/Nisto/musyx-extract.git")
md5sums=("SKIP")

pkgver() {
  	# move to the source directory
	cd "${srcdir}/musyx-extract"
  	
	# use the number of revisions since beginning of the history
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	# move to the source directory
	cd "${srcdir}/musyx-extract"

	# add the shebang to the script
	sed -i '1s/^/#!\/usr\/bin\/python\n/' MusyXExtract.py
}

package() {
	# move to the source directory
	cd "${srcdir}/musyx-extract"

	# make the script executable
	chmod +x MusyXExtract.py

	# install the script to /usr/bin
	install -Dm755 MusyXExtract.py "${pkgdir}/usr/bin/musyx-extract"
}
