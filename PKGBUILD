# Maintainer: Leonidas Spyropoulos (artafinde at gmail dot com)
# Contributor: scrawler@gmail.com

pkgname=freeplane-git
pkgver=preview.1.3.5_05.177.g8964c24
pkgrel=1
pkgdesc="A Java mindmapping tool"
arch=('i686' 'x86_64')
url="https://github.com/freeplane/freeplane.git"
license=('GPL')
makedepends=('git' 'apache-ant')
depends=('java-runtime')
source=('git://github.com/freeplane/freeplane.git' 'freeplane.desktop' 'freeplane.run')
md5sums=('SKIP'
         '85d40893aef0b71f9ffdf2dec4fbb0f0'
         'd72e3d0471338520f75a2fcf3ce536a7')


pkgver() {
	cd "${pkgname%-*}"
	# Use the tag of the last commit
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "${pkgname%-*}"
	ant build 
}

package() {
  cd ${srcdir}/${pkgname%-*}/${pkgname%-*}_framework/build
  find plugins -type f | while read file; do
    install -Dm644 ${file} ${pkgdir}/usr/share/freeplane/${file}
  done
  
  install -Dm644 freeplanelauncher.jar ${pkgdir}/usr/share/freeplane/freeplanelauncher.jar
  install -Dm644 freeplane.png ${pkgdir}/usr/share/pixmaps/freeplane.png
  install -Dm755 freeplane.sh ${pkgdir}/usr/share/freeplane/freeplane.sh
  install -Dm644 freeplane.svg ${pkgdir}/usr/share/freeplane/freeplane.svg
  install -Dm644 init.xargs ${pkgdir}/usr/share/freeplane/init.xargs
  install -Dm644 props.xargs ${pkgdir}/usr/share/freeplane/props.xargs
  install -Dm644 freeplaneIcons.dll ${pkgdir}/usr/share/freeplane/freeplaneIcons.dll
  install -Dm644 freeplane.l4j.ini ${pkgdir}/usr/share/freeplane/freeplane.l4j.ini
  install -Dm644 freeplaneConsole.l4j.ini ${pkgdir}/usr/share/freeplane/freeplaneConsole.l4j.ini
  install -Dm644 framework.jar ${pkgdir}/usr/share/freeplane/framework.jar
  install -Dm644 gitinfo.txt ${pkgdir}/usr/share/freeplane/gitinfo.txt

  # Where's the licence?
  #install -Dm644 license.txt ${pkgdir}/usr/share/freeplane/licence.txt

  mkdir -p ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF
  mkdir -p ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/ortho
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/templates
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/xslt
  mkdir -p ${pkgdir}/usr/share/freeplane/scripts

  install -Dm644 core/org.freeplane.core/META-INF/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF/
  install -Dm644 core/org.freeplane.core/lib/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib
  install -Dm644 resources/ortho/* ${pkgdir}/usr/share/freeplane/resources/ortho/
  install -Dm644 resources/templates/* ${pkgdir}/usr/share/freeplane/resources/templates/
  install -Dm644 resources/xslt/* ${pkgdir}/usr/share/freeplane/resources/xslt/
  install -Dm644 resources/gitinfo.properties ${pkgdir}/usr/share/freeplane/resources/gitinfo.properties
  install -Dm644 scripts/* ${pkgdir}/usr/share/freeplane/scripts/
  install -Dm644 doc/freeplane.mm ${pkgdir}/usr/share/freeplane/doc/freeplane.mm
  
  install -Dm644 ${srcdir}/freeplane.desktop ${pkgdir}/usr/share/applications/freeplane.desktop
  install -Dm755 ${srcdir}/freeplane.run ${pkgdir}/usr/bin/freeplane
}

