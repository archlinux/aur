# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Philacorns <opuspace@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-wqy-microhei-ibx
_name=wqy-microhei
pkgver=0.2.0_beta
pkgrel=11
pkgdesc="A Sans-Serif style high quality CJK outline font"
arch=('any')
license=(GPL3,Apache,custom:"font embedding exception")
groups=('infinality-bundle-fonts-extra')
url="http://wenq.org"
depends=('fontconfig')
conflicts=('wqy-microhei')
replaces=('wqy-microhei')
source=("http://downloads.sourceforge.net/project/wqy/${_name}/${pkgver//_/-}/${_name}-${pkgver//_/-}.tar.gz"
        40-wqy-microhei.conf
        90-non-tt-wqy-microhei.conf)
sha1sums=('28023041b22b6368bcfae076de68109b81e77976'
          '0468e9436df9e367901f373882ba92e6d842f714'
          '0c93e9b15f4ea8ff75faf2ad28aa1f516dda5914')

build() {
  cd "${_name}"
  tail README.txt --lines=16|head --lines=-3>| FONTEXCEPTION
}

package() {
  cd "${_name}"

  install -D -m644 FONTEXCEPTION \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -D -m644 wqy-microhei.ttc \
    "${pkgdir}"/usr/share/fonts/"${pkgname}"/wqy-microhei.ttc

  cd "${srcdir}"
  install -D -m644 40-wqy-microhei.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-wqy-microhei.conf
  install -D -m644 90-non-tt-wqy-microhei.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-non-tt-wqy-microhei.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-wqy-microhei.conf .
  ln -s ../conf.avail/90-non-tt-wqy-microhei.conf .
}
