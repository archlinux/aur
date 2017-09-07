# Maintainer: Nils Steinger (voidptr.de)
pkgname=checkinstall
pkgver=1.6.2
pkgrel=1
pkgdesc="Track files modified by an installation script and create a Slackware, RPM or Debian package"
arch=('i686' 'x86_64')
url="http://checkinstall.izto.org"
license=('GPL')
depends=('bash' 'glibc')
optdepends=('dpkg: to create deb packages')
makedepends=()
provides=('installwatch')
source=("http://checkinstall.izto.org/files/source/$pkgname-$pkgver.tar.gz"
        "installwatch.patch"
        "makefile.patch")
noextract=()
sha256sums=('dc61192cf7b8286d42c44abae6cf594ee52eafc08bfad0bea9d434b73dd593f4'
         '91f99f594953c3fa1d4f6a41a7d3fa3b4a86c5187b325145336608ab49e10d32'
         '46e60ae1c0b199051ac10e70dcad7dfc94508960e98885882b5d71a11fed7f0a')


prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/installwatch.patch"
	patch -p1 -i "$srcdir/makefile.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
