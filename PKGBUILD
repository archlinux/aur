# Maintainer: NSky Labs <nskysoft at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=4.17.0 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
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
b2sums=('26d71ff1d51a277752dfb6d9fe67d9542c3c9b2b45a088282d41e23efae6d68fb14f1321dbe5e7d44e2477382737e35a2a46526a42cc578b699ae3b71b95c455')

package() {
	install -dm 755 "${pkgdir}/usr/lib/${_name}/"
	bsdtar -xf "${srcdir}/${_zip}" -C "${pkgdir}/usr/lib/${_name}"
	chmod 755 "${pkgdir}/usr/lib/${_name}/func"
	ln -s "${_name}" "${pkgdir}/usr/lib/${_name}-${pkgver%%.*}"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_name}/func" "${pkgdir}/usr/bin/func"
}
