# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=xfce-polkit
pkgver=0.3
pkgrel=1
pkgdesc='A simple PolicyKit authentication agent for XFCE'
arch=('x86_64' 'i686')
url='https://github.com/ncopa/xfce-polkit'
license=(GPL)
depends=('polkit' 'libxfce4ui')
provides=('polkit-gnome')
conflicts=('xfce-polkit-git' 'polkit-gnome')
source=(https://github.com/ncopa/xfce-polkit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        xfce-polkit.desktop)
sha512sums=('2f6c2300caad1410f139e9192046a60e4e64954867085d22ab403f7808634cce7a269de05de13bebeda025c9e5251b1c042efc5af1417f0153dec47c616d15ba'
            '08843b55d193dfdaea9146500936e459a28971fbf5c1b9e045ca1247a319f3e0c030dba1cb58977e87951149993139df25328c14a5a5bf39fe60b35deb2ba433')

build() {
  cd ${pkgname}-${pkgver}
  aclocal
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/src/xfce-polkit "${pkgdir}"/usr/lib/${pkgname}/xfce-polkit
  install -Dm644 "${srcdir}"/xfce-polkit.desktop "${pkgdir}"/etc/xdg/autostart/xfce-polkit.desktop
}
