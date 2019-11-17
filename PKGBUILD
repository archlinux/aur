# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=jexiftoolgui
PkgName=jExifToolGUI
pkgver=1.0
pkgrel=1
pkgdesc="${PkgName} is a java/Swing graphical frontend for the excellent command-line ExifTool application by Phil Harvey"
arch=('any')
url="https://github.com/hvdwolf/${PkgName}"
license=("GNU General Public License v3.0")
depends=('java-runtime>=11' 'java-runtime-common' 'perl-image-exiftool' 'dcraw')
makedepends=('gradle')
source=("${pkgname}.git::git+https://github.com/hvdwolf/${PkgName}.git"
        ${pkgname})
md5sums=(SKIP '659be47fb6c4b9bea26dbce0cdf6f2c3')

build() {
cd ${srcdir}/${pkgname}.git
./gradlew buildDependents
mv ./build/libs/${PkgName}-all.jar ../${pkgname}.jar
}

package() {
mkdir -p "${pkgdir}/usr/bin"
mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
mkdir -p "${pkgdir}/usr/share/applications"
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/docs"
mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
mkdir -p "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
cd ${srcdir}
install -D -m644 ./${pkgname}.jar $pkgdir/usr/share/java/${pkgname}/
install -D -m755 ../${pkgname} $pkgdir/usr/bin/
cd ${srcdir}/${pkgname}.git
install -D -m644 ./packaging/debian/${pkgname}-48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/
install -D -m644 ./packaging/debian/${pkgname}-256x256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/
install -D -m644 ./packaging/debian/${pkgname}-32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/
install -D -m644 ./packaging/debian/${pkgname}.desktop ${pkgdir}/usr/share/applications/
install -D -m644 ./packaging/debian/copyright ${pkgdir}/usr/share/doc/${pkgname}/
install -D -m644 ./README.md ${pkgdir}/usr/share/doc/${pkgname}/
install -D -m644 ./LICENSE ${pkgdir}/usr/share/doc/${pkgname}/
#install -D -m755 ./docs/ ${pkgdir}/usr/share/doc/${pkgname}/
cp -R ./docs/ ${pkgdir}/usr/share/doc/${pkgname}/
chmod 755 ${pkgdir}/usr/share/doc/${pkgname}/docs
chmod 755 ${pkgdir}/usr/share/doc/${pkgname}/docs/css
chmod 755 ${pkgdir}/usr/share/doc/${pkgname}/docs/screenshots
}
