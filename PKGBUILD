# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=java3d
pkgver=1.5.2
pkgrel=8
pkgdesc="High-level constructs to create and manipulate 3D geometry"
arch=('i686' 'x86_64')
url="https://java3d.java.net/"
license=('custom:"JRL"')
depends=('java-runtime' 'libgl')
makedepends=('unzip')
_pkgname=j3d
if [ "$CARCH" = "i686" ] ; then
	_arch=i586
    md5sums=('0501179d850e6d05d30f2a3df861c2a5')
else
	_arch=amd64
    md5sums=('541d5038c54bbec2f1d311dfc5f68890')
fi
source=(http://download.java.net/media/$pkgname/builds/release/$pkgver/$_pkgname-${pkgver//./_}-linux-$_arch.zip)

package() {
	cd $srcdir/$_pkgname-${pkgver//./_}-linux-$_arch
	install -D -m644 LICENSE-Java3D-v${pkgver//./_}.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE
	local dest=$JAVA_HOME
	if [ "$dest" != "/usr/lib/jvm/java-7-openjdk/jre" ] ; then
		dest="$dest/jre"
	fi
	install -d -m755 $pkgdir/$dest
	cd $pkgdir/$dest
	unzip $srcdir/$_pkgname-${pkgver//./_}-linux-$_arch/$_pkgname-jre.zip
}
