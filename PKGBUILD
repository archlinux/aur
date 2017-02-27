# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>
# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-dejavu-ib
pkgver=2.37
pkgrel=1
pkgdesc="Font family based on the Bitstream Vera Fonts with a wider range of characters. Re-packed for infinality-bundle-fonts. TrueType version."
url="http://dejavu-fonts.org/wiki/Main_Page"
arch=('any')
depends=('fontconfig')
groups=('infinality-bundle-fonts')
conflicts=('ttf-dejavu' 't1-dejavu-ib')
provides=('ttf-font' 'ttf-dejavu' 'dejavu-ib')
replaces=('ttf-dejavu')
license=('custom')
source=('https://superb-sea2.dl.sourceforge.net/project/dejavu/dejavu/2.37/dejavu-fonts-ttf-2.37.tar.bz2'
        '45-dejavu.conf'
        '90-tt-dejavu.conf')
sha1sums=('7fa15e7b9676fc3915338c41e76ad454c344fff5'
          '4072385eb6d18754f932bda5634da259ab875a1b'
          'a6332f56d9d95636e9ac99643b3a241ba08f3499')

package() {
  cd "${srcdir}"/dejavu-fonts-ttf-${pkgver}
  install -dm755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 ttf/*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -Dm644 LICENSE \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -dm755 "${pkgdir}"/etc/fonts/conf.avail
  install -dm755 "${pkgdir}"/etc/fonts/conf.d
  install -m644 "${srcdir}"/45-dejavu.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-dejavu.conf
  install -m644 "${srcdir}/"90-tt-dejavu.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-dejavu.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-dejavu.conf .
  ln -s ../conf.avail/90-tt-dejavu.conf .
}

