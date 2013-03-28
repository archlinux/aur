# $Id: PKGBUILD 171364 2012-11-17 11:09:07Z ibiru $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-pptp-gtk2
pkgver=0.9.6.0
pkgrel=2
pkgdesc="NetworkManager VPN plugin for pptp "
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'pptpclient' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
provides=('networkmanager-pptp')
conflicts=('networkmanager-pptp')
install=networkmanager-pptp.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-pptp/0.9/NetworkManager-pptp-${pkgver}.tar.xz
        fix-path-to-auth-dialog.patch)
sha256sums=('a84cbbf24827229e3dd3611bbde191398275c3b7ecd03913047197644f27a2b4'
            '35f9c2cb4d046c8f215617e1a0bfd8551965bd0655af0cd25f89c17ea5e9081a')

build() {
  cd NetworkManager-pptp-${pkgver}
  patch -Np1 -i ../fix-path-to-auth-dialog.patch
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static \
	--with-gtkver=2
  make
}

package() {
  cd NetworkManager-pptp-${pkgver}
  make DESTDIR="${pkgdir}" install
}
