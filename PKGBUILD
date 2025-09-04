# Maintainer: S3ctor (corleycomputerrepair@protonmail.ch)
pkgname=umo-git
pkgver=0.10.9
pkgrel=1
pkgdesc="An automatic modlist downloader for Modding-OpenMW.com modlists"
arch=('i686' 'x86_64')
url="https://modding-openmw.gitlab.io/umo/"
license=('GPL')
makedepends=(git python gcc patchelf binutils)
provides=(umo)
conflicts=(umo-dev-bin)
options=(!lto !strip)
source=('git+https://gitlab.com/modding-openmw/umo')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	_tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
	_numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
	_hash="$(git rev-parse --short HEAD)"
	printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
}

build() {
	cd "$srcdir/umo"
}

package() {
	cd "$srcdir/umo"

	mkdir -p $pkgdir/usr/bin
	make install DEST_BINDIR=$pkgdir/usr/bin
}
