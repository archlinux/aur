# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=leafpad
pkgver=0.8.19
pkgrel=5
pkgdesc='A notepad clone for GTK+ 2.0'
arch=('x86_64')
url='http://tarot.freeshell.org/leafpad/'
license=('GPL-2.0-or-later')
depends=('gtk2')
makedepends=('intltool')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "0001-fix-format-security-error-from-gcc.patch"
        "0002-Updated-es.po.patch"
        "0003-Update-leafpad.desktop.in.patch"
        "0004-Update-pt.po.patch"
        "0005-Update-pt.po.patch")

sha256sums=('SKIP'
            'a96dda3d94642b139f59403bf734ca6fbac0e6039aaa5c9958a34b06dd85b068'
            '7abe586731272d00e0295b4afd0a0cc6f104e169791f13ade2e102910e57ee2c'
            'f847d58bb8281a4527ae1ec3e65a21199734835b136cd769531df755a50cb279'
            'e9e9f79db9184630abdbc1cfd22bc7ad13a184ee338aafab72804e267c985022'
            '260ab9ed4eb8d72b1574b7c9a75863d12623fc10b7ba6b37d247d4ad8b5357f0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < ../0001-fix-format-security-error-from-gcc.patch
  patch -Np1 < ../0002-Updated-es.po.patch
  patch -Np1 < ../0003-Update-leafpad.desktop.in.patch
  patch -Np1 < ../0004-Update-pt.po.patch
  patch -Np1 < ../0005-Update-pt.po.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-chooser
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  echo 'StartupNotify=true' >> "${pkgdir}/usr/share/applications/leafpad.desktop"
}
