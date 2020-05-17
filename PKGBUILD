# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=xfce-polkit
pkgver=0.3
pkgrel=1
pkgdesc='A simple PolicyKit authentication agent for XFCE'
arch=('x86_64' 'i686')
url='https://github.com/ncopa/xfce-polkit'
license=('GPL')
depends=('polkit' 'libxfce4ui')
provides=('polkit-gnome')
source=("https://github.com/ncopa/xfce-polkit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        xfce-polkit.desktop)
b2sums=('f37a9e905457dbcc2e76cb13f4e6be2ca10082d6a1a09732215fb0eadf1360cb85c78154f20de8ffdca6ad1f9d0920773fe655c7c45fde615741a2130cb5d09d'
        '7eb192592f826f76240ca1664081f4e092160b15e7d6c29e6a566ce57de54ef09834d1c2468ffb5afe790ad060296db61cfcd9b4aa990d77c559b61e242ee59f')

prepare() {
  cd ${pkgname}-${pkgver}
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/src/xfce-polkit "${pkgdir}"/usr/lib/${pkgname}/xfce-polkit
  install -Dm644 "${srcdir}"/xfce-polkit.desktop "${pkgdir}"/etc/xdg/autostart/xfce-polkit.desktop
}
