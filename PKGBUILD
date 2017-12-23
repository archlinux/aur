# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=doomcube
pkgver=2011
pkgrel=4
pkgdesc="The GPL Cube of Potential Doom."
arch=('i686' 'x86_64')
url="https://www.kismetwireless.net/doomcube/"
license=('GPL')
depends=('bash' 'libgl' 'freeglut')
makedepends=('libgl')
source=(http://www.kismetwireless.net/code/doomcube-$pkgver-02-R1.tar.gz
	doomcube-feed
	doomcube.desktop
	quiet.patch)
sha512sums=('d79794973a836351de87fe4161e9e9d33d48c2235ebe8c6e8d15e23a395e15127023f61f20df37b2fe4af962da3dcb0abca66b63c65b30d6aedc76b4e2a484d9'
            '4a90c11dbf06b398243b5e8d8c9afa460f565583530f3e11f0b6d38adc6bd84c81ff666351a6b235bde68acf596b3012e7389f88baa710e95ee1bedb174d442c'
            '98ee8d2e9abda783102fbea0685c01c2e62c48646b32df26bfa3c4f6e2d1f161f3c5ffd6f18825f9ce073d603a3fe959005e57bd1ed7dfe3c0c1a481fa21a7af'
            'd6070617e200cf36fc7d3d04c937e39a01bae40119daca46582806557d43f87105244550b7af2908e54f5413b970a62cb4ef9f7951ae07a66bfdd7b64778fba2')

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
        install -dm755 $pkgdir/usr/local/share/applications/
	install -Dm755 ${srcdir}/doomcube-$pkgver-02-R1/doomcube $pkgdir/usr/bin/
	install -Dm755 ${srcdir}/doomcube-feed $pkgdir/usr/bin/
	install -Dm644 ${srcdir}/doomcube.desktop $pkgdir/usr/local/share/applications/
}
