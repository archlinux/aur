# Contributor: Kozec <kozec at kozec dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=java-jdom1
pkgver=1.1.3
pkgrel=2
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
sha256sums=('d471718c4ac7a1a2f10715b93cb3fcd2ecbab60384b73ad1c089712e47bd8d1f'
            'd12bc5da956ccf98fcc0e44abbac4fa100cde0895098ea8d6a580015e2e45557'
            '5d7705068dceb457fabd515b95dd983a0899764c24f1d88184e755d0aecce239')

build() {
  [ -e core ] || ln -s jdom core
  for _i in core jdom-contrib jdom-test ; do
    pushd ${_i}
    chmod +x build.sh
    JAVA_HOME=/usr/lib/jvm/`archlinux-java get` ./build.sh
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

