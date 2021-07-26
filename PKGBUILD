# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=huaweicloud-obs-obsfs-git
pkgver=1.83.9ee91c6
pkgrel=1
pkgdesc="A file system tool provided by Object Storage Service (OBS) for mounting OBS parallel file systems"
arch=('x86_64')
url="https://support.huaweicloud.com/intl/en-us/fstg-obs/obs_12_0001.html"
license=('GPL2')
depends=('libxml2' 'curl' 'fuse2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#backup=(etc/passwd-obsfs)
#install='huaweicloud-obs-obsfs-git.install'
source=('git+https://github.com/huaweicloud/huaweicloud-obs-obsfs.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.%s" "$(grep AC_INIT configure.ac | grep -P "\d+.\d+" -o)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	chmod +x ./autogen.sh
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
