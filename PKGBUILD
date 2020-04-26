# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvstmanager
pkgver=1.0.2
pkgrel=1
pkgdesc="GUI Manager for the Linux VST Bridge (LinVST)"
arch=('x86_64')
url="https://github.com/Goli4thus/linvstmanager"
groups=('pro-audio')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('linvst2: VST2 to Linux bridge'
            'linvst2x: VST2 to Linux bridge as a single prcoess'
            'linvst3: VST3 to Linux bridge'
            'linvst3x: VST3 to Linux bridge as a single prcoess')
source=("https://github.com/Goli4thus/linvstmanager/archive/v${pkgver}.tar.gz")
sha256sums=('8e6c247a06802c41d84848d7ad910961e7f5a7ab0622be2d6716121401aa0051')

build() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j$(nproc) DESTDIR=${pkgdir}
}

package() {
	cd $srcdir/$pkgname-$pkgver/build
	make -j$(nproc) DESTDIR=${pkgdir} install
}
