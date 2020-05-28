# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-source-code-pro-ibx
pkgver=2.030ro+1.050it
_relver=2.030R-ro/1.050R-it
_tarver=${_relver//\//-}
pkgrel=1
depends=('fontconfig')
pkgdesc="A set of OpenType fonts designed for user interfaces"
url="http://www.adobe.com/"
arch=('any')
license=('custom:OFL')
conflicts=('adobe-source-code-pro-fonts' 'otf-source-code-pro' 'ttf-source-code-pro' 't1-source-code-pro-ibx' 'otf-source-code-pro-ibx')
groups=('infinality-bundle-fonts-extra')
source=("${_tarver}.tar.gz::https://github.com/adobe-fonts/source-code-pro/archive/${_relver}.tar.gz"
        45-source-code-pro.conf
        90-tt-source-code-pro.conf)
sha1sums=('fb8601043ec55da1b1cfd27a0843ea5eb14c6cad'
          'd20feb494116f95e4a35ad40f625a94f9a3bbcb2'
          'ae4fa14a8aa927e325a8bfd7c0f8db29eefb00ab')

package(){
  cd "source-code-pro-$_tarver"

  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 LICENSE.txt \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 TTF/*.ttf \
    "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-source-code-pro.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-source-code-pro.conf
  install -m644 90-tt-source-code-pro.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-source-code-pro.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-source-code-pro.conf .
  ln -s ../conf.avail/90-tt-source-code-pro.conf .
}
