# Maintainer: Marcello Haddeman <haddemanmarcello@gmail.com>
pkgname=ironwail
pkgver=0.7.0
pkgrel=2
pkgdesc="A fork of the popular GLQuake descendant QuakeSpasm with a focus on high performance instead of maximum compatibility, with a few extra features sprinkled on top."
arch=('i686' 'x86_64')
url="https://github.com/andrei-drexler/ironwail"
license=('GPL2')
depends=('sdl2' 'libvorbis' 'libmad')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrei-drexler/ironwail/archive/refs/tags/v$pkgver.tar.gz"
	"launch_ironwail.sh")
md5sums=('2dab1470dbad83bfa141da754dff076b'
	 '932be870cb7e5469b286e7a9937a5f35')

build() {
	cd "$srcdir/$pkgname-$pkgver/Quake"
	make DO_USERDIRS=1
}

package() {
	# Navigate to launch script
	cd "$srcdir"
	install -Dm755 launch_ironwail.sh "$pkgdir"/usr/bin/$pkgname

	# Navigate to built files
	cd "$pkgname-$pkgver/Quake"

	# Create Destination Directories
	install -d "${pkgdir}"/{usr/bin,/opt/ironwail}

	# Install executable and PAK file
	install -Dm755 ironwail "$pkgdir"/opt/$pkgname/ironwail
	install -Dm644 ironwail.pak "$pkgdir"/opt/$pkgname/ironwail.pak
}
