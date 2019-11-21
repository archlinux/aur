# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Martín Pizarro Ascui <martinpiz097@gmail.com>
pkgname=xpress-player
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Java Swing desktop music player"

arch=('any')
#url="https://github.com/martinpiz097/XpressPlayer/archive/$pkgver.tar.gz"
url="https://github.com/martinpiz097/XpressPlayer"
license=('GPL')
groups=()
depends=('maven' 'jdk8-openjdk' )
makedepends=()
checkdepends=()
optdepends=()
install=
changelog=
source=("XpressPlayer-${pkgver}.tar.gz::https://github.com/martinpiz097/XpressPlayer/archive/${pkgver}.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

build() {
	tar -xzf "XpressPlayer-${pkgver}.tar.gz"
}

package() {
	echo "#!/bin/bash" > $srcdir/XpressPlayer-$pkgver/run.sh
	echo "java -jar -Xms32m -Xmx256m /etc/xpress-player/XpressPlayer.jar" >> $srcdir/XpressPlayer-$pkgver/run.sh
	mkdir -p "$pkgdir/etc/$pkgname"
	install -Dm775 $srcdir/XpressPlayer-$pkgver/XpressPlayer.jar $pkgdir/etc/$pkgname/
	install -Dm777 $srcdir/XpressPlayer-$pkgver/run.sh $pkgdir/etc/$pkgname/	
	install -dm777 $pkgdir/usr/bin
	

	 find "${pkgdir}/etc/${pkgname}" -type d -exec chmod a+rx {} +
 	 find "${pkgdir}/etc/${pkgname}" -type f -exec chmod a+r {} +
	chmod a+rw "${pkgdir}/etc/${pkgname}/run.sh" "${pkgdir}/etc/${pkgname}/XpressPlayer.jar"
	ln -s "/etc/${pkgname}/run.sh" "${pkgdir}/usr/bin/${pkgname}" 

	#mv "${srcdir}/XpressPlayer.jar ${dir}"
	#touch /usr/bin/xpress-player
	#echo "#!/bin/bash" >> "${bindir}/xpress-player"
	#echo "java -jar -Xms32m -Xmx256m ${dir}/XpressPlayer.jar"  >> "${bindir}/xpress-player"
	#chmod 777 "${bindir}/xpress-player"
}

md5sums=('90f002b369b00339364fcfbb2926bb7a')
