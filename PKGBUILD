# Maintainer: Black_Codec <orso.f.regna@gmail.com>
 
pkgname=guacamole-client
pkgver=0.9.7
pkgrel=1
pkgdesc="Java and Maven components of Guacamole"
arch=('any')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
 
replaces=('guacamole')
 
depends=('java-runtime' 'tomcat8' 'guacamole-server')
 
makedepends=('maven')
 
source=("http://downloads.sourceforge.net/project/guacamole/current/source/$pkgname-$pkgver.tar.gz")
md5sums=('6d2355ac5a52df62e8eee5bbbe3d49e6')
 
backup=('etc/guacamole/guacamole.properties' 'etc/guacamole/user-mapping.xml')
 
build() {
	cd "$srcdir"/$pkgname-$pkgver
	mvn package
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat8/
	mkdir -m 775 -p "$pkgdir"/var/lib/tomcat8/webapps/
	mkdir -p "$pkgdir"/usr/share/tomcat8/.${pkgname%-*}/
	mkdir -p "$pkgdir"/etc/${pkgname%-*}/
	install -D ${pkgname%-*}/target/${pkgname%-*}-$pkgver.war "$pkgdir"/var/lib/tomcat8/webapps/${pkgname%-*}.war
	#install -D ${pkgname%-*}/doc/guacamole-example/${pkgname%-*}.properties "$pkgdir"/etc/${pkgname%-*}/
	install -D ${pkgname%-*}/doc/example/user-mapping.xml "$pkgdir"/etc/${pkgname%-*}/
	#ln -s /etc/${pkgname%-*}/${pkgname%-*}.properties "$pkgdir"/usr/share/tomcat8/.${pkgname%-*}/
	#sed -i 's|/path/to/|/etc/guacamole/|g' "$pkgdir"/etc/${pkgname%-*}/${pkgname%-*}.properties
}
