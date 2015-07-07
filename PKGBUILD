# Maintainer: Alucryd <alucryd at gmail dot com>
# Contributor: Christian Hesse <mail at eworm dot de>
# Contributor: pmelo86 <patrick at patrickmelo dot eti dot br>

pkgname=lightdm-webkit-greeter-bzr
pkgver=r13
pkgrel=1
pkgdesc="Webkit greeter for LightDM"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm-webkit-greeter"
license=('GPL3' 'LGPL3')
depends=('lightdm' 'webkitgtk2')
makedepends=('bzr' 'gnome-common' 'intltool')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
backup=("etc/lightdm/${pkgname%-*}.conf")
source=("${pkgname%-*}::bzr+http://bazaar.launchpad.net/~lightdm-team/lightdm-webkit-greeter/trunk/"
        "${pkgname%-*}.conf")
sha256sums=('SKIP'
            '96c76474299ea286b39a9327b760393ca8f6bfb6065ae3eb118d22609bcf9980')

pkgver() {
  cd "${srcdir}"/${pkgname%-*}
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${srcdir}"/${pkgname%-*}

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/lightdm
  make
}

package() {
  cd "${srcdir}"/${pkgname%-*}

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/etc/lightdm
  install -m 644 ../${pkgname%-*}.conf "${pkgdir}"/etc/lightdm/${pkgname%-*}.conf
}

# vim: ts=2 sw=2 et:
