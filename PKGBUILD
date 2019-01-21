# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=v2cmod-z
pkgver=2.19.1
_reldate=20190113
_b11ver=B11.25.1
_b11reldate=20190114
_b11povertyver=B11.25.1.2
pkgrel=8
pkgdesc="A 2ch/5ch and Twitter browser"
arch=("any")
url="http://v2c.s50.xrea.com/"
license=("custom")
depends=("bash" "java-environment")
source=("http://v2c.s50.xrea.com/V2C_2.11.4.tar.gz"
        "V2CMOD-Z.desktop"
        "v2cmod-z.sh"
        "https://www.dropbox.com/s/cvmbdghcf9pumlt/V2CMOD-Z_${pkgver}(R${_reldate}).zip"
        "https://www.dropbox.com/s/wkhbmllflilkpsw/v2c_api_patch_${_b11ver}_${_b11reldate}.zip"
        "https://www.dropbox.com/s/8peqlatop8ay2n8/v2c_api_patch_${_b11povertyver}_poverty_Patch.zip")
md5sums=("7e8915c4052eae46ffbee572b641deac"
         "da63137c36fc702722a0ac6800e60c50"
         "a67e56c497d030550e03f56e232f18d7"
         "1ce8457bfc604210cbff81baa449aa8a"
         "780362a88822b6f66c64cc1abcbd4558"
         "400bc9e17fba7b89f27aee0c145965e2")

prepare() {
	cd "${srcdir}/v2c/launcher"
	cp -f "${srcdir}/V2CMOD-Z_${pkgver}(R${_reldate})/V2C_R20131210.jar" "./"
	cp -f "${srcdir}/v2c_api_patch_${_b11ver}_${_b11reldate}/launcher/"{ReplaceStr_B11.txt,{bcprov-jdk15on,js-engine,rhino}.jar,cacerts,readcgi{,_aux}.js} "./"
	cp -f "${srcdir}/v2c_api_patch_${_b11povertyver}_poverty_Patch/v2c_api_patch_B11.jar" "./"
	sed -ie "s/V2C_R20131210.jar/v2c_api_patch_B11.jar/" "v2cjar.txt"
}

package() {
	install -d "${pkgdir}/opt/v2cmod-z"
	cp -r "${srcdir}/v2c/"{launcher,v2cicon.png} "${pkgdir}/opt/v2cmod-z"
	install "${srcdir}/v2c/"{mkdticon,rmdticon,v2c} "${pkgdir}/opt/v2cmod-z"
	chmod a+w "${pkgdir}/opt/v2cmod-z"
	chmod a+w "${pkgdir}/opt/v2cmod-z/launcher"

	install -d "${pkgdir}/usr/bin"
	install "${srcdir}/v2cmod-z.sh" "${pkgdir}/usr/bin/v2cmod-z"

	install -d "${pkgdir}/usr/share/applications"
	cp "${srcdir}/V2CMOD-Z.desktop" "${pkgdir}/usr/share/applications"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	touch "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
