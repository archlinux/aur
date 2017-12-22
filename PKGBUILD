# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=doomcube
pkgver=2011
pkgrel=2
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
            '96e810d5a0d2b1a45228830aa912083e32e0174c2ed7b0caa67fce302cb0a5596741d4ef82aaddb1243a9329aa6cfe7218104fc7c1c7d908784f187e18c75c9d'
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
	install -Dm755 ${srcdir}/doomcube-$pkgver-02-R1/doomcube $pkgdir/usr/bin/
	install -Dm755 ${srcdir}/doomcube-feed $pkgdir/usr/bin/
}
