# $Id: PKGBUILD 219416 2017-03-27 19:17:50Z shibumi $
# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor:dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=3.1
pkgrel=3
pkgdesc="SystemTap provides free software (GPL) infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python2')
makedepends=('python2-setuptools')
optdepends=('sqlite3')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz")
sha512sums=('10019b9c2d66f3f8d6e6ce3d1f3dfe99c9e5bda9f220eb2aa885643235c270c2004528cded0e94370cc0fc0c62d8fbe96cafa7609c619a8ee498335ecd0aa41d')
install='systemtap.install'

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/"${pkgname}" \
    --libdir=/usr/lib/"${pkgname}" \
    --mandir=/usr/share/man/ \
    --localstatedir=/var/run/"${pkgname}" \
    --enable-pie \
    --disable-docs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

