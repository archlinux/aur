# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=doomcube
pkgver=2011
pkgrel=1
pkgdesc="The GPL Cube of Potential Doom."
arch=('i686' 'x86_64')
url="https://www.kismetwireless.net/doomcube/"
license=('GPL')
depends=('bash' 'libgl' 'freeglut')
makedepends=('libgl')
source=(http://www.kismetwireless.net/code/doomcube-$pkgver-02-R1.tar.gz
	doomcube-feed
	quiet.patch)
sha512sums=('d79794973a836351de87fe4161e9e9d33d48c2235ebe8c6e8d15e23a395e15127023f61f20df37b2fe4af962da3dcb0abca66b63c65b30d6aedc76b4e2a484d9'
            'ce4b36bb0d35384f2766b6b5af06fbc18f3c3dc9fd5f70e141bdf0e4826713fc55952476125a50873d20594abc4b8efb95c2741d8bc1c307fd296f1934129006'
            '15d4fadf8935d90e71aba14a2e66f737ed26d4e6f18ea69e90ccb6d54d85ccdd2efa6e7e6023b9f7588dd61d07b451e4e9b392c37be3451c6b96e9273aace4c1')

prepare() {
	cd ${srcdir}/doomcube-$pkgver-02-R1
	patch -Np2 < ../quiet.patch
}

build() {
	cd ${srcdir}/doomcube-$pkgver-02-R1
	./configure --prefix=/usr
	make
}

package() {
        install -dm755 $pkgdir/usr/bin/
	install -Dm755 ${srcdir}/doomcube-$pkgver-02-R1/doomcube $pkgdir/usr/bin/
	install -Dm755 ${srcdir}/doomcube-feed $pkgdir/usr/bin/
}
