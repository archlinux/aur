# Maintainer: Bjoern Foersterling <bjoern.foersterling@gmail.com>
pkgname=mdtoc
pkgver=0.1.4
pkgrel=1
epoch=
pkgdesc="Command line Markdown viewer/editor/toc generator."
arch=('x86_64')
url="https://github.com/bfoersterling/mdtoc"
license=('GPL')
groups=()
depends=('cmark' 'readline')
checkdepends=('check' 'valgrind')
optdepends=()
provides=('mdtoc')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/bfoersterling/mdtoc.git#tag=v${pkgver}")
cksums=('SKIP')
noextract=()
sha256sums=()
validpgpkeys=()

check() {
	cd "$pkgname"
	make test
}

build() {
	cd "$pkgname"
	make
}

package() {
	declare binary
	binary="${srcdir}/${pkgname}/${pkgname}"
	declare dest_dir
	dest_dir="${pkgdir}/usr/bin"
	declare dest_file
	dest_file="${dest_dir}/${pkgname}"

	# debugging
	echo "srcdir: ${srcdir}"
	echo "pkgdir: ${pkgdir}"
	echo "startdir: ${startdir}"

	mkdir -pv "$dest_dir" || echo "Failed to create dir ${dest_dir}"

	if [[ ! -f "$binary" ]]; then
		echo "Binary ${binary} does not exist."
		exit 1
	fi

	if ! install -v -m 755 "$binary" "${dest_file}"; then
		echo "Installing ${pkgname} binary to ${dest_file} failed."
		exit 1
	fi
}
