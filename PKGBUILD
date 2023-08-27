# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=ceb2txt
pkgname=$_pkgname-git
pkgver=0.2.1.r0.5854cb1
pkgrel=1
pkgdesc='Small tool that can convert ceb files to simple plain text'
arch=('any')
url="https://github.com/inputmice/ceb2txt"
license=('Apache')
depends=('java-runtime=11' 'bash')
makedepends=('git' 'java-environment=11' 'maven')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('ceb2txt-git::git+https://github.com/iNPUTmice/ceb2txt.git' 'ceb2txt')
md5sums=('SKIP'
         'f992aa1c4ff4190b639c8d54babb31d5')

pkgver() {
	cd "$srcdir/$pkgname"
	
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	mvn package
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 target/im.conversations.ceb2txt*.jar $pkgdir/usr/share/java/$_pkgname/$_pkgname.jar

	cd "$srcdir"
	install -Dm755 ceb2txt $pkgdir/usr/bin/ceb2txt
}
