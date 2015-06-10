# $Id: 992fa3e31a82fe7f834a510476e8773a401b858c $
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgname="bmon-git"
pkgver=3.6.15.g2ccea2c
pkgrel=1
pkgdesc="Portable bandwidth monitor and rate estimator"
arch=('i686' 'x86_64')
url="http://people.suug.ch/~tgr/bmon/"
license=('MIT')
depends=('confuse' 'ncurses')
makedepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/tgraf/bmon.git')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"

  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "${pkgname%-*}"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-asound
  make
}

package() {
  cd "${pkgname%-*}"

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}/usr/share/doc/${pkgname%-*}"
  install -m 644 ChangeLog LICENSE.MIT LICENSE.BSD "${pkgdir}/usr/share/doc/${pkgname%-*}/"
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname-*}/LICENSE."{MIT,BSD} "${pkgdir}/usr/share/licenses/${pkgname}/"
}
