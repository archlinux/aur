# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=xdg-app
pkgver=0.3.1
pkgrel=1
pkgdesc='An application deployment framework for desktop apps'
arch=('i686' 'x86_64')
url='https://github.com/alexlarsson/xdg-app'
license=('GPL2')
depends=('ostree' 'libseccomp')
install='xdg-app.install'
source=("https://github.com/alexlarsson/xdg-app/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('745fceedf27e364142b6fb909263b2a63d081263237dd23bca03668fd2c08ac1')

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

