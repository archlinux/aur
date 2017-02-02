pkgname=exfat-utils-autodetect
pkgver=1.2.5
pkgrel=1
pkgdesc="Utilities for exFAT file system"
arch=('i686' 'x86_64')
url="https://github.com/relan/exfat"
depends=( 'fuse2' 'glibc')
makedepends=( 'rsync')
conflicts=( 'exfat-utils')
provides=( 'exfat-utils')
license=('GPL2')
source_x86_64=("exfat-utils-x86_64.pkg.tar.xz::https://www.archlinux.org/packages/community/x86_64/exfat-utils/download/")
md5sums_x86_64=('SKIP')
source_i686=("exfat-utils-i686.pkg.tar.xz::https://www.archlinux.org/packages/community/i686/exfat-utils/download/")
md5sums_i686=('SKIP')
source=("mount.exfat")
md5sums=('2b15364aacb5a79081e069c73a88dd9a')
options=('!strip')

pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}

package() {
	mkdir -p ${pkgdir}/usr
	rsync -Prltv --delete ${srcdir}/usr ${pkgdir}/ --exclude usr/bin/mount.exfat
	install -Dm 755 ${srcdir}/mount.exfat ${pkgdir}/usr/bin/mount.exfat
}
