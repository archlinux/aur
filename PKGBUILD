# $Id: PKGBUILD 88127 2013-04-12 09:51:38Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-ubuntu-font-family-ib
pkgver=0.83
pkgrel=3
pkgdesc="Ubuntu font family. Part of infinality-bundle-fonts."
arch=('any')
url="http://font.ubuntu.com/"
license=('custom:Ubuntu Font Licence 1.0')
depends=('fontconfig')
groups=('infinality-bundle-fonts')
conflicts=('ttf-ubuntu-font-family')
provides=('ttf-font' 'ttf-ubuntu-font-family')
replaces=('ttf-ubuntu-font-family' 'ttf-ubuntu-font-family-ibx')
source=(http://font.ubuntu.com/download/ubuntu-font-family-$pkgver.zip
        45-ubuntu.conf
        90-tt-ubuntu.conf)
sha1sums=('fad7939b33af4ae9ce803b403373ff49bbf1233f'
          '5089359e856cb621d24746f79f64e85e53ce35c8'
          '00de40a3bdfc1d6fefa40e5acf00f54c1dbce7cf')

package() {
  cd "ubuntu-font-family-${pkgver}"

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 Ubuntu-{L,R,B,C}*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 UbuntuMono-*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 LICENCE.txt \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  cd "${srcdir}"
  install -D -m644 45-ubuntu.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-ubuntu.conf
  install -D -m644 90-tt-ubuntu.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-ubuntu.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-ubuntu.conf .
  ln -s ../conf.avail/90-tt-ubuntu.conf .
}
