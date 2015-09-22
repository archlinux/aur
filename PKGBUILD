# Current Maintainer: Kozec <kozec at kozec dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>
# Prev. Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=java-jdom1
pkgver=1.1.3
pkgrel=1
pkgdesc="Older version of XML Parsing Library for Java"
arch=('any')
url="http://www.jdom.org"
license=('GPL')
depends=('java-runtime')
conflicts=('java-jdom')
provides=("java-jdom=$pkgver")
makedepends=('apache-ant')
source=(http://www.jdom.org/dist/binary/archive/jdom-$pkgver.tar.gz \
        http://www.jdom.org/dist/binary/archive/jdom-contrib-$pkgver.tar.gz \
        http://www.jdom.org/dist/binary/archive/jdom-test-$pkgver.tar.gz \
        )

build() {
	[ -e core ] || ln -s jdom core
	for _i in core jdom-contrib jdom-test ; do
		pushd ${_i}
		chmod +x build.sh
		./build.sh
		popd
	done
}

package() {
	for _i in jdom jdom-test ; do
		install -D -m755 ${_i}/build/${_i}-${pkgver}.jar \
			${pkgdir}/usr/share/java/jdom/${_i}.jar
  	done
	for _i in jdom-contrib ; do
		install -D -m755 ${_i}/build/${_i}-1.1.2-snap.jar \
			${pkgdir}/usr/share/java/jdom/${_i}.jar
  	done
}

md5sums=('dc8391e84cfdb170fcd8279aa370019f'
         'fc4a7afe5acecbfbe7e0f9a48ab085dc'
         'e1720c6c44049ac354c8fa14940b933f')
