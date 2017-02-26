# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Alexander Blinne <alexander[at]blinne[dot]net>

pkgname="fatresize"
pkgver="1.0.2"
pkgrel=2
pkgdesc="A utility to resize FAT filesystems using libparted."
url="http://sourceforge.net/projects/fatresize/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('parted' 'glibc')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "http://archive.ubuntu.com/ubuntu/pool/universe/f/${pkgname}/${pkgname}_${pkgver}-7build1.debian.tar.gz")
sha256sums=('55fe0834fee07caa2b79b12648bbcd82a07780fa85afd780b504ef7625229713'
            'd15144c689e81c3cc2dea7f77e2b22399dbe89d6bd9c9e4969a1d10e4f96c656')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < ../debian/patches/pkg-config.patch
	patch -p1 < ../debian/patches/ped_free.patch
	patch -p1 < ../debian/patches/libparted-3.1.patch
	autoreconf -fiv
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=4 sw=2 ft=sh et:
