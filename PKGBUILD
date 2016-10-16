# Maintainer: Your Name <Alchemy-aur@bartus.33mail.com>
pkgname=alchemy-svn
pkgver=r574
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Nonorthodox painting software exploring and experimenting with alternative ways of drawing"
url="http://al.chemy.org/"
license=('GPL')
depends=('sh' 'java-environment' 'hicolor-icon-theme')
makedepends=('subversion' 'apache-ant' 'imagemagick')
md5sums=('SKIP'
         'c7cffede4dda0acd94aa94deec037720')
source=("${pkgname}::svn+http://svn.al.chemy.org/svn/"
	"alchemy.desktop"
	)

pkgver() {
  cd ${pkgname}
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd ${pkgname}/Alchemy
	ant
}

package() {
	cd ${pkgname}/Alchemy/
	chmod -R o+r dist/*
	install -dm755 ${pkgdir}/opt/alchemy
        cp -r -t ${pkgdir}/opt/alchemy dist/Alchemy/*
	install -dm755 ${pkgdir}/usr/bin
	echo -e "#!/bin/sh\nexec /opt/alchemy/Alchemy" > ${pkgdir}/usr/bin/alchemy
	echo -e "#!/bin/sh\nexec /opt/alchemy/AlchemyOpenGL" > ${pkgdir}/usr/bin/alchemy-opengl
	chmod +x ${pkgdir}/usr/bin/*
	install -dm755 ${pkgdir}/usr/share/doc/alchemy
	cp -r -t ${pkgdir}/usr/share/doc/alchemy dist/javadoc/*
	convert res/Alchemy.ico alchemy.png
	install -Dm644 "alchemy-0.png" "${pkgdir}/usr/share/icons/hicolor/apps/256x256/alchemy.png"
	install -Dm644 "alchemy-0.png" "${pkgdir}/usr/share/pixmaps/alchemy.png"
	install -Dm644 "alchemy-1.png" "${pkgdir}/usr/share/icons/hicolor/apps/128x128/alchemy.png"
	install -Dm644 "alchemy-2.png" "${pkgdir}/usr/share/icons/hicolor/apps/48x48/alchemy.png"
	install -Dm644 "alchemy-3.png" "${pkgdir}/usr/share/icons/hicolor/apps/32x32/alchemy.png"
	install -Dm644 "alchemy-4.png" "${pkgdir}/usr/share/icons/hicolor/apps/24x24/alchemy.png"
	install -Dm644 "alchemy-5.png" "${pkgdir}/usr/share/icons/hicolor/apps/16x16/alchemy.png"
	install -Dm644 "../../alchemy.desktop" "${pkgdir}/usr/share/applications/alchemy.desktop"
}
