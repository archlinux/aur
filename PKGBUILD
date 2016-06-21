# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("qemu-user-static-deb")
pkgver=2.6
pkgrel=1
_postfix=2.6+dfsg-3
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
		_deb="qemu-user-static_${_postfix}_i386.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("86d03e8f479e2e37996f920e9b1c452c")
		;;
	"x86_64")
		_deb="qemu-user-static_${_postfix}_amd64.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("493a481e6da7650fbaa513767aaab39c")
		;;
	"arm")
		_deb="qemu-user-static_${_postfix}_armel.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("2a4a2739d5889b2d5ba462725b59bb2f")
		;;
	"armv6h")
		_deb="qemu-user-static_${_postfix}_armhf.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("ec72b2e59b1bda3a4406bea879fa2b78")
		;;
	"armv7h")
		_deb="qemu-user-static_${_postfix}_armhf.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("ec72b2e59b1bda3a4406bea879fa2b78")
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
