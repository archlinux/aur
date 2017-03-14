# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=nfs-ganesha-git
pkgver=10720.437cb6711
pkgrel=1
pkgdesc="Nfs-ganesha supports both the NFS and 9P protocols."
arch=('any')
url="http://nfs-ganesha.github.io/"
license=('GPL3')
depends=()
makedepends=('git' 'cmake' 'gcc' 'bison' 'flex')
source=("$pkgname"::'git://github.com/nfs-ganesha/nfs-ganesha.git')
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd ${pkgname}
	git submodule update --init
}

package() {
	cd "${pkgname}"
	cmake src/ -DUSE_9P=OFF
	make
}
