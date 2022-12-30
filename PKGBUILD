# Maintainer: éclairevoyant
# Contributor: Chang Feng <chang_196700 at hotmail dot com>
# Contributor: Ivan Fonseca <ivanfon at riseup dot net>
# Contributor: boosterdev at linuxmail at org

_gitname=xdm
pkgname=xdman
pkgver=7.2.11
pkgrel=3
epoch=1
pkgdesc="Xtreme Download Manager: download manager with multiple browser integrations"
arch=('i686' 'x86_64')
url="https://xtremedownloadmanager.com/"
depends=('ffmpeg' 'java-runtime>=11' 'python' 'sh' 'youtube-dl')
makedepends=('java-environment>=11' 'maven')
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/subhra74/$_gitname/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh")
b2sums=('8987f8f68823b1224cb6c01becaf40be57440d4c0dba80c65b583b02964f8f5e77cd27c072a63ff4b47f6f1931f13b3d5fa63196841ecf7e28f96f5227da9b52'
        '788ae28b70bc510b0c865bebd5f53d857820908421d40b2ecc76b390e6f5de55c2f76a93c2cc4017cbcd7df7cf4855a0243217abfccc9843dde88188fe6c3fc0')

build() {
	cd $_gitname-$pkgver/app
	mvn package
}

package() {
	install -Dm644 $_gitname-$pkgver/app/target/$pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	ln -s /usr/bin/ffmpeg "$pkgdir/usr/share/java/$pkgname/"
	ln -s /usr/bin/youtube-dl "$pkgdir/usr/share/java/$pkgname/"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
