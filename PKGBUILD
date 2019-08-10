# Maintainer: dustball

# Rinse RPM Distro Bootstrapper

pkgname=rinse
pkgver=3.3
pkgrel=1
pkgdesc="Bootstrap a rpm based distribution like debootstrap"
arch=('any')
url="https://salsa.debian.org/debian/rinse"
license=('GPL')
groups=()
depends=('glibc' 'perl' 'perl-html-parser' 'perl-uri' 'perl-libwww' 'wget' 'rpm-org' 'cpio')
makedepends=('make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/rinse/rinse.conf')
options=()
install=
source=("https://salsa.debian.org/debian/rinse/-/archive/3.3/rinse-${pkgver}.tar.gz"
        "sbin.patch")
noextract=()
md5sums=('aad4821a80959981769ea03302c65187'
         '4cf97714bbd4785cf39f2f729b5cc6fa')

prepare() {
  patch -p0 -i $srcdir/sbin.patch
  sed -i 's|pod2man.*$|pod2man --release=$pkgver --official --section=8 ./bin/rinse ./bin/rinse.8|' $srcdir/$pkgname-$pkgver/Makefile
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/" sbindir="$pkgdir/bin" install
}

