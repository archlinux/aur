# Maintainer: NSky Labs <nskysoft at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=4.16.1 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
pkgrel=1
pkgdesc="Command line tools for Azure Functions"
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
optdepends=('dotnet-runtime: to install extensions') # https://github.com/Azure/azure-functions-core-tools/issues/367
options=(staticlibs !strip)
_zip="Azure.Functions.Cli.linux-x64.${pkgver}.zip"
source=("https://github.com/Azure/${_name}/releases/download/${pkgver}/${_zip}")
noextract=("${_zip}")
b2sums=('9f909d77d090b36b625c3f137e4f2a9cba7446738927d06c5f7db8fd602ab85cd56547b3f7e49374e586efaf9d60d2a2c4f107994449abd6a8c6297c82bf43b1')

package() {
	install -dm 755 "${pkgdir}/usr/lib/${_name}/"
	bsdtar -xf "${srcdir}/${_zip}" -C "${pkgdir}/usr/lib/${_name}"
	chmod 755 "${pkgdir}/usr/lib/${_name}/func"
	ln -s "${_name}" "${pkgdir}/usr/lib/${_name}-${pkgver%%.*}"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_name}/func" "${pkgdir}/usr/bin/func"
}
