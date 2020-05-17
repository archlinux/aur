# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: by Eric Viveiros <eviveiro at gmail dot com>

_pkgname=xfce-polkit
pkgname=${_pkgname}-git
pkgver=0.3.r1.g89bab1e
pkgrel=1
pkgdesc='A simple PolicyKit authentication agent for XFCE'
arch=('x86_64' 'i686')
url='https://github.com/ncopa/xfce-polkit'
license=('GPL')
depends=('polkit' 'libxfce4ui')
makedepends=('git')
provides=("${_pkgname}" "polkit-gnome")
conflicts=("${_pkgname}" "polkit-gnome")
source=("git+https://github.com/ncopa/xfce-polkit"
        xfce-polkit.desktop)
b2sums=('SKIP'
        'c4f811e62e3a002ab8a00ccea26a9ce41db5f9ce0c0584adaa305ee9d9dc26199c00967461d5ca92f2a63387783f6a9473ad279bc45214e75b255dbbb0d87e60')

pkgver() {
  cd ${_pkgname}
  echo $(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

prepare() {
  cd ${_pkgname}
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  install -Dm755 "${srcdir}"/${_pkgname}/src/xfce-polkit "${pkgdir}"/usr/lib/${_pkgname}/xfce-polkit
  install -Dm644 "${srcdir}"/xfce-polkit.desktop "${pkgdir}"/etc/xdg/autostart/xfce-polkit.desktop
}
