# Maintainer: Europrimus <aur-g4gra at europrimus dot ninja>
pkgname=pesconvert-git
pkgver=r20.d6d7001
pkgrel=2
epoch=
pkgdesc="Convert embroidery pes file (used by Brother sewing machines) to an image (png or svg)."
arch=('x86_64')
url="https://www.linux.com/news/embroidery-gaah/"
license=('unknown')
groups=()
depends=()
makedepends=('git' 'make' 'gcc' 'shared-mime-info' 'coreutils')
checkdepends=()
optdepends=()
provides=('pesconvert')
conflicts=('pesconvert')
replaces=()
backup=()
options=()
install=".install"
changelog='change.log'
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/pesconvert.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

check() {
	if [ -f "${srcdir}/${pkgname}/pesconvert" ]; then
		echo "pesconvert compiled"
	else
		echo "pesconvert not compiled"
		exit 1
	fi
}

package() {
	cd "${srcdir}/${pkgname}"
	install -D "pesconvert" -t "$pkgdir/usr/bin/"
	install -D "PES-Mime.xml" -t "$pkgdir/usr/share/mime/packages/"
	install -D "PES.thumbnailer" -t "$pkgdir/usr/share/thumbnailers/"
	mkdir --parents "$pkgdir/usr/local/bin/"
	ln -s "/usr/bin/pesconvert" "$pkgdir/usr/local/bin/application-x-pesfile-thumbnailer"
}
