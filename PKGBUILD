# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvstmanager
pkgver=1.0.1
pkgrel=1
pkgdesc="GUI Manager for the Linux VST Bridge (LinVST)"
arch=('x86_64')
url="https://github.com/Goli4thus/linvstmanager"
depends=('qt5-base')
makedepends=('cmake')
optdepends=('linvst2: VST2 to Linux bridge'
            'linvst2x: VST2 to Linux bridge as a single prcoess'
            'linvst3: VST3 to Linux bridge'
            'linvst3x: VST3 to Linux bridge as a single prcoess')
source=("https://github.com/Goli4thus/linvstmanager/archive/v${pkgver}.tar.gz")
sha256sums=('afab55994617a9f6397315a87cd63c56bb911c4642711f78129858796a558e3a')

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
