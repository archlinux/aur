# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cowberry-boot
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimal sysvinit script set designed for Raspberry Pi"
url="https://github.com/maandree/cowberry-boot"
arch=(armv6h x86_64 i686)
license=(GPL3)
backup=(etc/rc.local{.devd.wait,.hooks,.shutdown,} etc/rc.{multi,shutdown,single,sysinit} etc/{inittab,rc.conf})
depends=(sysvinit dash coreutils util-linux grep filesystem glibc)
optdepends=(kbd kmod udev)
makedepends=(make gcc glibc coreutils)
conflicts=(initscripts initscripts-fork pony-initialisation)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(19841d59d8f9a416f76afc4b8fe665eea9918d9a0843bccd5fec14b2753e0ec3)


build() {
        cd "${srcdir}/cowberry-boot-${pkgver}"
        make DESTDIR="${pkgdir}"
	
	# Use util-linux::agetty instead of gates-of-tartaros as default
	sed -i 's:/sbin/got tty\([0-9]*\) TERM=linux:/sbin/agetty -8 -s 38400 tty\1 linux:' conf/inittab
}

package() {
        cd "${srcdir}/cowberry-boot-${pkgver}"
        make DESTDIR="${pkgdir}" install
        _dir="${pkgdir}/usr/share/licenses/${pkgname}"
        ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

