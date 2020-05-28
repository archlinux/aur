# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-unfonts-core-ibx
_name=un-fonts-core
pkgver=1.0.2
_pkgrev=080608
pkgrel=1
_realver=2607
depends=('fontconfig')
pkgdesc="Un Core family of Korean TrueType fonts"
url="http://kldp.net/projects/unfonts/"
arch=('any')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-unfonts-core' 'ttf-unfontscore')
replaces=('ttf-unfonts-core' 'ttf-unfontscore')
license=('custom')
source=(http://kldp.net/unfonts/release/${_realver}-${_name}-${pkgver}-${_pkgrev}.tar.gz
        40-unfonts-core.conf
        90-tt-unfonts-core.conf)
sha1sums=('4245d08649a0acc26d8c73e707b61371b9370e7a'
          '17fd5aeff0a6f61c2a4e30b08327762600c9cc05'
          'bc9f39c51b4ca56cdd8167ff351c11d37a243ff0')

package(){
  cd un-fonts

  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -D -m644 40-unfonts-core.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-unfonts-core.conf
  install -D -m644 90-tt-unfonts-core.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-unfonts-core.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-unfonts-core.conf .
  ln -s ../conf.avail/90-tt-unfonts-core.conf .
}
