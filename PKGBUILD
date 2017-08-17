# Maintainer: parchd <parchd@archlinux.info>
pkgname=opensmtpd-table-sqlite
pkgver=201607122008
pkgrel=1
pkgdesc="table-sqlite for using sqlite with OpenSMTPd"
arch=('i686' 'x86_64')
url="https://opensmtpd.org"
license=('custom:opensmtpd')
depends=('opensmtpd')
conflicts=('opensmtpd-extras')
makedepends=('openssl')
optdepends=()
source=("https://www.opensmtpd.org/archives/opensmtpd-extras-$pkgver.tar.gz")
sha256sums=('00a41fd9d468908f0863443acc4af99a894b44e9b6ca0cb6c93079447be2c5d0')

prepare() {
  cd "opensmtpd-extras-$pkgver"
}

build() {
  cd "opensmtpd-extras-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/smtpd \
    --libexecdir=/usr/lib/smtpd \
    --with-table-sqlite
  make
}

check() {
  cd "opensmtpd-extras-$pkgver"
  make -k check
}

package() {
  cd "opensmtpd-extras-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm $pkgdir/usr/share/man/man3/filter_api.3
  rmdir $pkgdir/usr/share/man/man3
}
