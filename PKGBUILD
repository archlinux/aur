# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=4.7.0 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
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
b2sums=('7e771eda52a9b6e1b3c7cf901e87d8248bf5dd064dcda0184edf666eb9d2ba98dd90e2d29121d5f436c167e607effe09b9574076033f94c887eb7bb8edad6a8a')

package() {
	install -dm 755 "${pkgdir}/usr/lib/${_name}/"
	cp -r "${srcdir}/"* "${pkgdir}/usr/lib/${_name}"
	install -m 755 "func" "${pkgdir}/usr/lib/${_name}/"
	chmod a+x "${pkgdir}/usr/lib/${_name}/gozip" # https://github.com/Azure/azure-functions-core-tools/issues/1850

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_name}/func" "${pkgdir}/usr/bin/func"
}
