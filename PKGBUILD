# Maintainer:

pkgname=powershell-lts-bin
_pkgver=7.4.5
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
	"1d1735d20c1658adade49e737b3c94f8f468fcebf947fb5f414c34aabd4b04fa4d35b8bdf8de88552f2b0c4684c863ef2a251d52a6648f0314fb1a1462ea549b"
	"07f5fc69a6d9417049e4f53fbfc96c26c79d0ed33c6e161b3543bc5690476ecdac612aeede9ecff4352bea70ae32bd2fae8b0af0839b986aa1f728f8a9fcfce3"
)

prepare() {
	cd ${srcdir}/
	mkdir ${pkgname}
	bsdtar -x -f ${_deb_name} -C ${pkgname}/
	bsdtar -x -f ${pkgname}/data.tar.gz -C ${pkgname}/
}

package() {
	cp -ar ${srcdir}/${pkgname}/opt ${pkgdir};
	cp -ar ${srcdir}/${pkgname}/usr ${pkgdir};

	cp -ar ${pkgdir}/usr/local/share ${pkgdir}/usr;
	rm -r -f ${pkgdir}/usr/local
}
