# Maintainer: éclairevoyant
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

pkgname=quiterss
pkgver=0.19.4
pkgrel=3
pkgdesc='Fast and light RSS/Atom feed reader written in Qt/С++'
arch=('x86_64')
url='https://quiterss.org/'
license=('GPL3')
depends=('gst-plugins-good' 'qt5-multimedia' 'qt5-webkit')
makedepends=('qt5-tools')
source=("https://github.com/QuiteRSS/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'install-appdata.patch')
b2sums=('d1515a13b4b26a9bfae1760d25e1ab28b1ca797806dc49f2826631764755ad61f5ed887a1c17f6728f45b0fd33271f06157acb1a529a628e0a0f5acb436bee23'
        '264544b9ecaa01be3afa6d6930aa1006e21c3b87de5b71e304961fc9b8ad5fbc895e7a911fb48bd4560260d2af9959ee6c80699d1ebf24d7e3ce182d1f50fe7e')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../install-appdata.patch
	sed -i '/INSTALLS +=/ s/ target1//' QuiteRSS.pro
}

build() {
	cd $pkgname-$pkgver
	qmake-qt5 CONFIG+=release PREFIX=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make INSTALL_ROOT="$pkgdir" install
}
