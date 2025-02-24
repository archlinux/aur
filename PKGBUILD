# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=rjsupplicant
pkgver=4.90
pkgrel=1
pkgdesc="Ruijie Supplicant for Linux 锐捷认证客户端 Linux 版"
arch=('i686' 'x86_64')
url="https://www.ruijie.com.cn/"
license=('proprietary')
depends=(
	'bash'
	'krb5'
	'glibc'
	'gcc-libs'
	'zlib'
	'e2fsprogs'
)
makedepends=('unzip')
source=("RG_SU_For_Linux_${pkgver//\./_}_Setup1.zip::https://github.com/stevezxc/rjsupplicant/raw/refs/heads/main/RG_SU_For_Linux_${pkgver//\./_}_Setup1.zip")
sha256sums=('18dac58c315999507cc278a8b33053a4aeb231669d3896f452720fd887c739a9')
build()
{
	cd "${srcdir}"
	unzip -o RG_SU_For_Linux_${pkgver//\./_}_Setup1.zip
	sed -i -e '3d' -e '16,24d' -e '27,37c\ \tcd "/opt/rjsupplicant"\n\tsh -c "/opt/rjsupplicant/rjsupplicant $arg"' "${srcdir}/${pkgname}/${pkgname}.sh"
}
package()
{
	_arch=""
	if [ "$CARCH" == "x86_64" ]; then
		_arch="x64"
	elif [ "$CARCH" == "i686" ]; then
		_arch="x86"
	fi
	mkdir -p "${pkgdir}/opt/${pkgname}"
	mv -T "${srcdir}/${pkgname}/${_arch}" "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
