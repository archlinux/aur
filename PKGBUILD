# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("qemu-user-static-deb")
pkgver=2.3
pkgrel=1
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation, statically linked."
arch=("i686" "x86_64" "arm" "armv6h" "armv7h")
url="http://wiki.qemu.org/Index.html"
license=("GPL2" "LGPL2.1")
provides=("qemu-user-static" "qemu-static" "binfmt-qemu-static")
conflicts=("qemu-user-static" "qemu-static" "binfmt-qemu-static")
install="${pkgname}.install"
source=("qemu-user-static-deb.conf")
md5sums=("1d8e7dcd511742cc7a09230437eedce9")
case "${CARCH}" in
	"i686")
		_deb="qemu-user-static_2.3+dfsg-6a_i386.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("dcf01386b4f929038cefc4c83a089391")
		;;
	"x86_64")
		_deb="qemu-user-static_2.3+dfsg-6a_amd64.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("51adba659c5d0ab2ab478a23824c0d8f")
		;;
	"arm")
		_deb="qemu-user-static_2.3+dfsg-6a_armel.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("6869d3b2f6a49cfeb3d461045e90a6c0")
		;;
	"armv6h")
		_deb="qemu-user-static_2.3+dfsg-6a_armhf.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("44d1a1bbaa88068a4c8a70d075cc1b67")
		;;
	"armv7h")
		_deb="qemu-user-static_2.3+dfsg-6a_armhf.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("44d1a1bbaa88068a4c8a70d075cc1b67")
		;;
esac

prepare() {
	cd "${srcdir}"
	ar p "${_deb}" data.tar.xz | bsdtar xf -
}

package() {
	install -dm755 "${pkgdir}/usr/lib/binfmt.d"
	install -Dm644 "${srcdir}/qemu-user-static-deb.conf" "${pkgdir}/usr/lib/binfmt.d/"

	install -dm755 "${pkgdir}/usr/bin/"
	install -Dm755 "${srcdir}/usr/bin/"* "${pkgdir}/usr/bin/"

	install -dm755 "${pkgdir}/usr/share/man/"
	install -Dm644 "${srcdir}/usr/share/man/man1/"* "${pkgdir}/usr/share/man/"
}
