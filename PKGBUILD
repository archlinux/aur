# Maintainer: robertfoster

pkgname=libpam-google-authenticator
pkgver=1.05
pkgrel=1
pkgdesc='PAM module for google authenticator app'
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/google/google-authenticator-libpam"
license=('Apache')
depends=('pam')
optdepends=('qrencode: scannable QR codes for google auth phone app')
conflicts=('google-authenticator-libpam-git' 'google-authenticator-libpam-hg')
source=("https://github.com/google/google-authenticator-libpam/archive/${pkgver}.tar.gz")
install=${pkgname}.install

build() {
  cd $srcdir/google-authenticator-libpam-${pkgver}
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/google-authenticator-libpam-${pkgver}
  make DESTDIR=$pkgdir install
  libtool --finish $pkgdir/usr/lib/security
}

md5sums=('c06f0f38fd91ac4b6b0965b932f80eb9')
