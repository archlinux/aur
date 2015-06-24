# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=xdg-app
pkgver=0.3.4
pkgrel=1
pkgdesc='An application deployment framework for desktop apps'
arch=('i686' 'x86_64')
url='https://github.com/alexlarsson/xdg-app'
license=('GPL2')
depends=('ostree' 'libseccomp')
install='xdg-app.install'
source=("https://github.com/alexlarsson/xdg-app/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('fc16e219502a5b299f70a85706f2c4ccc5529cc7999161bc17bc72e129563ab0')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # remove setuid flag, instead we set CAP_SYSADMIN and CAP_MKNOD in the install script
  chmod -s "$pkgdir/usr/bin/xdg-app-helper"
}

