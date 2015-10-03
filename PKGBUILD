# Maintainer: Black_Codec <orso.f.regna@gmail.com>
 
pkgname=guacamole-client
pkgver=0.9.8
pkgrel=2
pkgdesc="Java and Maven components of Guacamole"
arch=('any')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
 
replaces=('guacamole')
 
depends=('java-runtime' 'tomcat7' 'guacamole-server')
 
makedepends=('maven')
 
source=("http://downloads.sourceforge.net/project/guacamole/current/source/$pkgname-$pkgver.tar.gz" "guacamole.properties")
md5sums=('588ac66f02c5f28a87be1ca562c5ccef' '1f3ec0a32cc3c6b4f7aeb8a3b2e7531b')
 
backup=('usr/share/tomcat7/.guacamole/guacamole.properties' 'usr/share/tomcat7/.guacamole/user-mapping.xml')
 
build() {
	cd "$srcdir"/$pkgname-$pkgver
	mvn package
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat7/
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat7/webapps/
	mkdir -p "$pkgdir"/usr/share/tomcat7/.${pkgname%-*}/
	install -D ${pkgname%-*}/target/${pkgname%-*}-$pkgver.war "$pkgdir"/var/lib/tomcat7/webapps/guacamole.war
	install -D ${pkgname%-*}/doc/example/user-mapping.xml "$pkgdir"/usr/share/tomcat7/.guacamole/
	install -D "$srcdir"/guacamole.properties "$pkgdir"/usr/share/tomcat7/.guacamole/
}
