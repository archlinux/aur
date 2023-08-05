# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=vmlinux-to-elf-git
_pkgname=vmlinux-to-elf
pkgver=r88.b407a46
pkgrel=1
pkgdesc="This tool allows to obtain a fully analyzable .ELF file from a vmlinux/vmlinuz/bzImage/zImage kernel image, with recovered function and variable symbols."
arch=('x86_64')
url="https://github.com/marin-m/${_pkgname}"
license=('GNU')
depends=(
	python
	python-lz4
	python-zstandard
)
makedepends=(
	git
	python-setuptools
)
source=("$_pkgname::git+https://github.com/marin-m/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname" || exit 1
	python setup.py build
}

package() {
	cd "$_pkgname" || exit 1
	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
