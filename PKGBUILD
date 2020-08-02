# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=jexiftoolgui
PkgName=jExifToolGUI
pkgver=1.4.1
pkgrel=1
pkgdesc="${PkgName} is a java/Swing graphical frontend for the excellent command-line ExifTool application by Phil Harvey"
arch=('any')
url="https://github.com/hvdwolf/${PkgName}"
license=("GNU General Public License v3.0")
depends=('java-runtime=11' 'java-runtime-common' 'perl-image-exiftool' 'dcraw')
makedepends=('gradle')
source=("${pkgname}.git::git+https://github.com/hvdwolf/${PkgName}.git"
        ${pkgname})
md5sums=(SKIP '97b47e506cb0f82facf24c43a07a3c03')

build() {
cd ${srcdir}/${pkgname}.git
./gradlew buildDependents
mv ./build/libs/${PkgName}-all.jar ../${pkgname}.jar
}

package() {
cd ${srcdir}
install -D -m644 -t ${pkgdir}/usr/share/java/${pkgname}/ ./${pkgname}.jar
install -D -m755 -t ${pkgdir}/usr/bin/                   ../${pkgname}
cd ${srcdir}/${pkgname}.git
install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ ./LICENSE ./packaging/debian/copyright
install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ ./README.md
cp -R --preserve=mode ./docs/ ${pkgdir}/usr/share/doc/${pkgname}/
cd ${srcdir}/${pkgname}.git/packaging/debian/
install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/48x48/apps/   ${pkgname}-48x48.png 
install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/256x256/apps/ ${pkgname}-256x256.png
install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/32x32/apps/   ${pkgname}-32x32.png 
install -D -m644 -t ${pkgdir}/usr/share/applications/               ${pkgname}.desktop
}
