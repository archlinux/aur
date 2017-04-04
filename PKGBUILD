# Mainainer: bohoomil <@zoho.com>

pkgname=ttf-roboto-ibx
pkgver=2.136
pkgrel=1
pkgdesc="Modern sans-serif font family designed by Christian Robertson and introduced with Android Ice Cream Sandwich operating system. Basic, condensed and slab variants included."
arch=('any')
license=('Apache')
url="http://code.google.com/android/"
depends=('fontconfig')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-roboto' 'ttf-roboto-fontconfig' 'ttf-roboto-slab')
# http://www.google.com/fonts
# all scripts
source=(https://github.com/google/roboto/releases/download/v$pkgver/roboto-hinted.zip
        Roboto_Condensed.zip::https://fonts.google.com/download?family=Roboto%20Condensed
        Roboto_Slab.zip::https://fonts.google.com/download?family=Roboto%20Slab
        45-roboto.conf
        90-tt-roboto.conf)
validgpgkeys=('A9244FB5E93F11F0E975337FAE6866C7962DDE58')
sha1sums=('6ac3eb489359fae05a80411bdf12f22e064b1011'
          '73dcb814feea819ac13a2a1942b83ec6fecb73e4'
          'a63d1390fcdce3eba61679c0f16786ac64d4c0f3'
          '8ff0fd3af47b4234cdb40746a29aa613fc8dc502'
          '05cffa42f1ac56bf5595afe2ab67e656555273fb')

package(){
  install -D -m644 "LICENSE.txt" \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 roboto-hinted/*.ttf \
    "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-roboto.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-roboto.conf
  install -D -m644 90-tt-roboto.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-roboto.conf

  install -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-roboto.conf .
  ln -s ../conf.avail/90-tt-roboto.conf .
}
