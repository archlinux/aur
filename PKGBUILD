# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>
 
pkgname=guacamole-client
pkgver=0.9.11
pkgrel=1
pkgdesc="Java and Maven components of Guacamole"
arch=('any')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacamole')
depends=('java-runtime' 'tomcat7')
makedepends=('maven')
source=("http://downloads.sourceforge.net/project/guacamole/current/source/$pkgname-$pkgver-incubating.tar.gz" "guacamole.properties")
install=guacamole-client.install

md5sums=('83b5ef7dbccc4cc25b0cd7b88fac8c67'
         '1f3ec0a32cc3c6b4f7aeb8a3b2e7531b')
 
backup=('usr/share/tomcat7/.guacamole/guacamole.properties' 'usr/share/tomcat7/.guacamole/user-mapping.xml')
 
build() {
	cd "$srcdir"/$pkgname-$pkgver-incubating
	mvn package
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver-incubating
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat7/
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat7/webapps/
	mkdir -p "$pkgdir"/usr/share/tomcat7/.${pkgname%-*}/
	install -D ${pkgname%-*}/target/${pkgname%-*}-$pkgver-incubating.war "$pkgdir"/var/lib/tomcat7/webapps/guacamole-incubating.war
	install -D ${pkgname%-*}/doc/example/user-mapping.xml "$pkgdir"/usr/share/tomcat7/.guacamole/
	install -D "$srcdir"/guacamole.properties "$pkgdir"/usr/share/tomcat7/.guacamole/
}
