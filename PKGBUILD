# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: by Eric Viveiros <eviveiro at gmail dot com>

_pkgname=xfce-polkit
pkgname=${_pkgname}-git
pkgver=27.89bab1e
pkgrel=1
pkgdesc='A simple PolicyKit authentication agent for XFCE'
arch=('x86_64' 'i686')
url="https://github.com/ncopa/xfce-polkit"
license=(GPL)
depends=('polkit' 'libxfce4ui')
makedepends=('git')
provides=("${_pkgname}" "polkit-gnome")
conflicts=("${_pkgname}" "polkit-gnome")
source=(git+$url
        xfce-polkit.desktop)
sha256sums=('SKIP'
            'c7a18aa56a9e0b7b35f0817fa420a506b4b78d18baf62cece4e7488b3e93d968')

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_pkgname}
  aclocal
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  install -Dm755 "${srcdir}"/${_pkgname}/src/xfce-polkit "${pkgdir}"/usr/lib/${_pkgname}/xfce-polkit
  install -Dm644 "${srcdir}"/xfce-polkit.desktop "${pkgdir}"/etc/xdg/autostart/xfce-polkit.desktop
}
