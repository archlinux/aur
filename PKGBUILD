# Maintainer: Saurabh Kumar Sharma <saurabh000345 at gmail dot com>

pkgname=mctlauncher
pkgver=1.0
pkgrel=1
pkgdesc="Minecraft TLauncher Client for the AUR <visit tlauncher.org>"
arch=("any")
url="https://www.tlauncher.org"
license=("GPL")
depends=("jdk-openjdk" "java-runtime>=8" "unzip")
makedepends=("imagemagick")

# Change this if there's a 404 return
_jar="https://tlauncher.org/jar"
noextract=("jar")

source=( "$_jar" "${pkgname}.desktop" "${pkgname}.png" "${pkgname}")
sha256sums=("5aee06077942a4c2c1def6a532fc3232e87acdf7d806b018ba5a9ff48dd52acd" 
"ef0fb9ccaf1bf78e476f38498ad68c3943060e16a97898ac5a5d732e2311fe21" 
"e481b09b5e7592405db862c8a162f7050df6183d32b98d6c36db04a7acad3fe7" 
"2f16c9a88194dd3e70ab3b9205dd06bee51679f72c311e6dc8d91d5fb08a52e4")

prepare() {
	unzip -o jar -d mctlauncher-ext/
	mv mctlauncher-ext/*.jar mctlauncher-ext/mctlauncher.jar
}

package() {
        install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin/}
        cp -rL "${srcdir}/${pkgname}-ext" "${pkgdir}/opt/${pkgname}"
        install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
        do
                install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
                convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
        done
}
