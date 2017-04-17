# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=dungeonfs
pkgver=r12.6fdee80
pkgrel=1
pkgdesc="A FUSE filesystem and dungeon crawling adventure game engine."
arch=('x86_64'
      'i386'
      'armv6h')
url='https://github.com/ChrisRx/dungeonfs'
license=('BSD')
depends=('fuse2')
makedepends=('go'
	     'make'
	     'git')
source=("git://github.com/ChrisRx/dungeonfs.git")
sha256sums=('SKIP')
_giturl=github.com/ChrisRx/dungeonfs

build() {
	GOPATH="${srcdir}/go" go get -u -v "${_giturl}/..."
}

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/go"
	install -D "bin/dungeonfs" -t "${pkgdir}/usr/bin/"
	install -Dm644 "src/${_giturl}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/${pkgname}/"
	cp -a "src/${_giturl}/examples" "${pkgdir}/usr/share/${pkgname}/"
}
