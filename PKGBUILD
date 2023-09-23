# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=4.0.5348 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
pkgrel=1
pkgdesc="Command line tools for Azure Functions"
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
optdepends=('dotnet-runtime: to install extensions') # https://github.com/Azure/azure-functions-core-tools/issues/367
options=('staticlibs')
source=("https://github.com/Azure/${_name}/releases/download/${pkgver}/Azure.Functions.Cli.linux-x64.${pkgver}.zip")
b2sums=('c3ac004e4b3a8c9f202870147fbf58cef640350de3f8b4c72fabceb00abd738115f0bff8aa3b9fa66c7fc2f0d5e9ea5c26c6631eb238162050d1ea2029e64c90')

package() {
	install -dm 755 "${pkgdir}/usr/lib/${_name}/"
	cp -r "${srcdir}/"* "${pkgdir}/usr/lib/${_name}"
	install -m 755 "func" "${pkgdir}/usr/lib/${_name}/"
	chmod a+x "${pkgdir}/usr/lib/${_name}/gozip" # https://github.com/Azure/azure-functions-core-tools/issues/1850

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_name}/func" "${pkgdir}/usr/bin/func"
}
