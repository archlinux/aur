# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=sasquatch-git
pkgrel=1
pkgver=r59.24b9581
pkgdesc='Patched unsquashfs utility with support for vendor-specific SquashFS implementations.'
arch=('x86_64')
url='https://github.com/devttys0/sasquatch'
license=('unknown')
source=("${pkgname}"::'git+'$url'.git'
        0001-No-install.patch)
sha512sums=('SKIP'
            'c94ebf6c2274b81fa749b226d04804d0f1d0e20b6579f74717584abbf5590bfa68e13b31163aa69ab6b5e5f214a30b8ce74115ea343bede05ddf8ae19008d37b')

prepare() {
	cd "$pkgname"
	git am "${srcdir}/0001-No-install.patch"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	./build.sh
}

package() {
	cd "${srcdir}/${pkgname}/squashfs"*"/squashfs-tools/"
	install -D -m0755 sasquatch ${pkgdir}/usr/local/bin/sasquatch
}
