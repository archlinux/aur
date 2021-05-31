# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=minosoft
pkgname=$_pkgname-git
pkgver=r1377.eba0cf5d
pkgrel=1
pkgdesc="Open source minecraft client, written from scratch in java."
arch=('any')
url="https://gitlab.bixilon.de/bixilon/minosoft"
license=('GPL3')
depends=('java-runtime>=14' 'sh')
makedepends=('git' 'maven' 'java-environment')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitlab.bixilon.de/bixilon/minosoft.git"
	"$_pkgname.png::https://gitlab.bixilon.de/bixilon/minosoft/-/raw/rendering/doc/img/Minosoft_logo.png"
	'minosoft.sh'
	'minosoft.desktop')
md5sums=('SKIP'
         '0cd7c197d6c9335927a572443f43ce62'
         'ccf32826e6ba903bad8653160af7d731'
         '26f1f6230fb117c558f848a08165c8d5')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	mvn clean package
}

check() {
	cd "$srcdir/$_pkgname"
	mvn verify
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 target/Minosoft-0.1-jar-with-dependencies.jar "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"

	cd "$srcdir"
	install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/minosoft"
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
