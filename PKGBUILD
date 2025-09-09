# Maintainer: Pooyan Khanjankhani <pooyankhan@gmail.com>

source common

pkgname=ella
pkgver="$(latest)"
pkgrel=1
pkgdesc="A process manager for running and managing services"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'loong64' 'mips' 'mips64' 'mips64le' 'mipsle' 'riscv64')
url="https://github.com/thekhanj/ella"
license=('MIT')
makedepends=('curl' 'grep' 'sed' 'awk')

_os=$(uname | tr '[:upper:]' '[:lower:]')
_arch=$(uname -m)

mapfile -t binnames <<<"$(get_binnames "$pkgver")"

case "${_os}_${_arch}" in
linux_x86_64) binname="${binnames[0]}" ;;
linux_aarch64) binname="${binnames[1]}" ;;
linux_armv7l) binname="${binnames[2]}" ;;
linux_armv6l) binname="${binnames[3]}" ;;
linux_loong64) binname="${binnames[4]}" ;;
linux_mips) binname="${binnames[5]}" ;;
linux_mips64) binname="${binnames[6]}" ;;
linux_mips64le) binname="${binnames[7]}" ;;
linux_mipsle) binname="${binnames[8]}" ;;
linux_riscv64) binname="${binnames[9]}" ;;
*)
	echo "Unsupported OS/ARCH: ${_os}_${_arch}"
	exit 1
	;;
esac

source=("https://github.com/thekhanj/ella/releases/download/v${pkgver}/${binname}")
sha256sums=("$(get_checksum "$pkgver" "$binname")")

package() {
	cd "${srcdir}"
	tar xzvf "${binname}"
	cd "${binname%.tar.gz}"
	./install "$pkgdir" false
}
