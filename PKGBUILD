# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org> ([core] package)
# Maintainer: Thomas Bächler <thomas@archlinux.org> ([core] package)

pkgname=mkinitcpio-git
pkgver=23.r2.g91b2125
pkgrel=1
pkgdesc='Modular initramfs image creation utility - git checkout'
arch=('any')
url='http://www.archlinux.org/'
license=('GPL')
depends=('awk' 'mkinitcpio-busybox' 'kmod' 'util-linux' 'libarchive' 'coreutils'
         'bash' 'findutils' 'grep' 'filesystem' 'gzip' 'systemd-tools')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
makedepends=('git' 'asciidoc')
provides=('mkinitcpio')
conflicts=('mkinitcpio')
backup=('etc/mkinitcpio.conf')
source=('git://projects.archlinux.org/mkinitcpio.git')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd mkinitcpio/

	make DESTDIR="${pkgdir}" install
}

