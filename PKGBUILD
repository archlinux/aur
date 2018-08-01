# Maintainer: weearc <q19981121@163.com>

pkgname=proxyeedown
_pkgname=proxyeedown
pkgver=2.54
pkgrel=1
epoch=0
pkgdesc="a powerful tool to download things from baidu netdisk"
arch=("x86_64")
url="https://github.com/proxyee-down-org/proxyee-down"
license=('custom')

source=("https://github.com/weearc/pkgbuild/releases/download/2.54/proxyee-down-$pkgver-jar.zip"
        "https://github.com/weearc/pkgbuild/releases/download/2.54/jre-8u181-linux-x64.tar.gz"
        "${_pkgname}.desktop"
        "cloud.png"
        )

md5sums=('ca1de33a60bf289d387483fb4d7108bc'
         '7681dd61646361856b16141c59bebd51'
         'fb0acaea6fac6d9a0261d361b3f340af'
         '5a5087aca873d220b598fd63d5364429')

         
package() {
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/icons"
	
	install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -m644 "${srcdir}/cloud.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
	
	cp  -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R
	cd "${pkgdir}/opt/${_pkgname}"
	tar -xvf jre-8u181-linux-x64.tar.gz 
	unzip proxyee-down-$pkgver-jar.zip
	rm jre-8u181-linux-x64.tar.gz proxyee-down-$pkgver-jar.zip
	echo "#!/bin/bash" > $pkgdir/usr/bin/$_pkgname
	echo "/opt/${_pkgname}/jre1.8.0_181/bin/java -jar /opt/${_pkgname}/proxyee-down-2.54/proxyee-down.jar" >> $pkgdir/usr/bin/$_pkgname
	chmod +x $pkgdir/usr/bin/$_pkgname
}
