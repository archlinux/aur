# Maintainer: Guilherme <leonsombrio244@gmail.com>

pkgname=elf-stat-git
pkgver=0.1.r0.g1234567 
pkgrel=1
pkgdesc="Elf-stat is a low-level utility designed to inspect file metadata on linux x86_64."
arch=('x86_64')
url="https://github.com/simeulinuxkaliaiwr/elf-stat"
license=('MIT')
makedepends=('git' 'nasm' 'gcc')
provides=('elf-stat')
conflicts=('elf-stat')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgbuild() {
	cd "${pkgname}"

	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags | sed 's/\([^-]*-\)*g/r\1/;s/-/./g'
	else
		printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 build/elf-stat "${pkgdir}/usr/bin/elf-stat"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
