# Maintainer: Bjarno Oeyen <aur _AT_ bjarno _DOT_ be>

pkgname=ambienttalk
pkgver=2.22
pkgrel=1
pkgdesc="AmbientTalk is an experimental object-oriented distributed programming language. The language is primarily targeted at writing programs deployed in mobile ad hoc networks."
arch=(any)
url="http://soft.vub.ac.be/amop/"
license=('MIT')
depends=(java-runtime)
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ambienttalk/at2dist060213.zip ambienttalk.sh)
noextract=()
md5sums=('9773c4955f077a09b77b40298bbed3db'
         '2d322f998a04af289fb0f08853619c1e')

package() {
	# copy jar files tp /usr/share/java/ambienttalk
	install -d "$pkgdir"/usr/share/java/ambienttalk
	cp "$srcdir"/ambienttalk2.jar "$pkgdir"/usr/share/java/ambienttalk
	find "$srcdir"/jlib -type f -name "*.jar" | xargs cp -t "$pkgdir"/usr/share/java/ambienttalk

	# install run script in /usr/bin
	install -d "$pkgdir"/usr/bin
	cp "$srcdir"/ambienttalk.sh "$pkgdir"/usr/bin/ambienttalk
	chmod +x "$pkgdir"/usr/bin/ambienttalk

	# copy bundled atlib to /usr/share/ambienttalk
	install -d "$pkgdir"/usr/share/ambienttalk
	cp -r "$srcdir"/atlib "$pkgdir"/usr/share/ambienttalk

	# copy license
	install -d "$pkgdir"/usr/share/licenses/ambienttalk/
	cp "$srcdir"/license "$pkgdir"/usr/share/licenses/ambienttalk/LICENSE
}
