# Maintainer: White-Oak <lpzhelud@gmail.com>
pkgname=servo-latest
pkgver=r20160710
pkgrel=1
pkgdesc="A modern, high-performance browser engine being developed for application and embedded use"
arch=('x86_64')
url="https://servo-builds.s3.amazonaws.com/index.html"
license=('custom:Mozilla Public License v2.0')
provides=('servo')
conflicts=('servo')
dependencies=('desktop-file-utils')
sha256sums=('SKIP'
            '7087917409c30bb5de3931dc35d18f60407837165d6f9dda941a27928e07512f'
            '3db78572e8657cca9e9446ce56a057b8a981eb41af318c49a5fe08e7a10fa52a'
            '2d006fbdb6434b7470d5fc1d0abd5ba4ce9436b29443fc527067fa421d0c1ac2')
source=(
	"https://servo-builds.s3.amazonaws.com/nightly/linux/servo-latest.tar.gz"
	"Servo.desktop"
	"LICENSE"
	"servo-latest"
)

pkgver(){
	time=$(curl -s -v -X HEAD "https://servo-builds.s3.amazonaws.com/nightly/linux/servo-latest.tar.gz" 2>&1\
	 | grep '^< Last-Modified:'\
	 | sed -n -e 's/^< Last-Modified: //p')
	date --date="$time" +r%Y%m%d
}

package() {
	install -Dm755 "$srcdir/Servo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	install -dm755 "$pkgdir/opt/servo"
	chmod -R 755 servo
	cp -r "servo" "$pkgdir/opt"

	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
