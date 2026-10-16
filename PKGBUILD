# Maintainer:

pkgname=powershell-lts-bin
_pkgver=7.6.7
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='PowerShell Core is a cross-platform (Windows, Linux, and macOS) automation and configuration tool/framework'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
depends=('krb5' 'gcc-libs' 'glibc' 'lttng-ust' 'zlib' 'openssl' 'icu')
provides=('powershell')
conflicts=('powershell' 'powershell-bin')
options=(staticlibs !strip)
install=powershell.install

_deb_name=powershell-lts_${_pkgver}-1.deb_amd64.deb

source=(
	"https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/${_deb_name}"
	"${install}"
)

sha512sums=(
	"36e0c646a1a1aa0a7b9ea25cfed6c5cd1ce6fcd99fcb82969478a083511830d49a32b871bcf1043d70a07140e902c40d3e63bc8f37978c4e975f0a9d363354ea"
	"07f5fc69a6d9417049e4f53fbfc96c26c79d0ed33c6e161b3543bc5690476ecdac612aeede9ecff4352bea70ae32bd2fae8b0af0839b986aa1f728f8a9fcfce3"
)

prepare() {
	cd ${srcdir}/
	mkdir ${pkgname}
	bsdtar -x -f ${_deb_name} -C ${pkgname}/
	bsdtar -x -f ${pkgname}/data.tar.xz -C ${pkgname}/
}

package() {
	cp -ar ${srcdir}/${pkgname}/opt ${pkgdir};
	cp -ar ${srcdir}/${pkgname}/usr ${pkgdir};
}
