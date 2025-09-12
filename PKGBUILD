# Maintainer:

pkgname=powershell-lts-bin
_pkgver=7.4.12
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
	"8344ecd26e2416cb738cf6416547cdc2fba51ad9738e422cdc689274a6ebf63f8cf105e3381c667741cd880b7d65eaabe04359f225366e787116fd57ca836cb6"
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
