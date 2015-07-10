# Maintainer: Braden Pellett (daBrado) <aurcontact@dabrado.net>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>

_pkgname=terminus-font
pkgname=${_pkgname}-ll2-td1
pkgver=4.39
pkgrel=1
pkgdesc='A superb, monospace bitmap font (for X11 and console) with ll2 patch (pass the il1I test) and td1 patch (centered ascii tilde)'
arch=(any)
url=http://sourceforge.net/projects/terminus-font/
license=(GPL2 custom:OFL)
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
conflicts=(terminus-font)
provides=(terminus-font)
install=terminus-font.install
source=(http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('1ec1bee67a1c017f349bc8558b2d4fa6')

build() { 
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch < alt/ll2.diff
  patch < alt/td1.diff
  sh ./configure --prefix=/usr --x11dir=/usr/share/fonts/local --psfdir=/usr/share/kbd/consolefonts
  make
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 75-yes-terminus.conf "${pkgdir}/etc/fonts/conf.avail/75-yes-terminus.conf"
  install -dm755 "${pkgdir}/etc/fonts/conf.d"
  ln -sf -t "${pkgdir}/etc/fonts/conf.d" ../conf.avail/75-yes-terminus.conf
  install -Dm644 OFL.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
