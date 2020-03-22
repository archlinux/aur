# Maintainer: André Almeida <andrealmeid@riseup.net>

pkgname=amdgpuinfo-git
_pkgname=amdgpuinfo
pkgrel=2
pkgver=0.1.130.befb94d
pkgdesc="Get information from AMD Radeon GPUs"
arch=('x86_64')
url="https://github.com/andrealmeid/amdgpuinfo"
license=('GPL3')
depends=('pciutils')
makedepends=('git' 'gcc' 'meson')
source=('git://github.com/andrealmeid/amdgpuinfo.git')
md5sums=('SKIP')

ver() {
	prefix="        version: '"
	echo $(grep "$prefix" meson.build | sed -e "s/${prefix}//" | sed "s/',//")
}

pkgver() {
	cd "$_pkgname"
	hash=$(git log --pretty=format:'%h' -n 1)
	revision=$(git rev-list --count HEAD)
	echo $(ver).$revision.$hash
}

build() {
	cd "$_pkgname"
	arch-meson build --prefix /usr
	ninja -C build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C build install
}
