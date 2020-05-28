# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-source-sans-pro-ibx
pkgver=3.006
pkgrel=1
depends=('fontconfig')
pkgdesc="A set of OpenType fonts designed for user interfaces"
url="http://www.adobe.com/"
arch=('any')
license=('custom:OFL')
conflicts=('adobe-source-sans-pro-fonts' 'otf-source-sans-pro' 'ttf-source-sans-pro' 't1-source-sans-pro-ibx' 'otf-source-sans-pro-ibx')
groups=('infinality-bundle-fonts-extra')
source=(https://github.com/adobe-fonts/source-sans-pro/archive/"$pkgver"R/"$pkgver"R.tar.gz
        45-source-sans-pro.conf
        90-tt-source-sans-pro.conf)
sha1sums=('b3a98136de180cda6e28a0b298dae88c1b888b47'
          'f692d46268b32bc62cb5a4dc515f9a427daf3d8c'
          '94f54a3f68ee1706db1d0a017b59b5c620fe45cd')

package(){
  cd "source-sans-pro-${pkgver}R"

  install -m755 -d "$pkgdir"/usr/share/licenses/"$pkgname"
  install -m644 LICENSE.md \
    "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING

  install -m755 -d "$pkgdir"/usr/share/fonts/"$pkgname"
  install -m644 TTF/*.ttf \
    "$pkgdir"/usr/share/fonts/"$pkgname"

  cd "$srcdir"
  install -m755 -d "$pkgdir"/etc/fonts/conf.avail
  install -m755 -d "$pkgdir"/etc/fonts/conf.d
  install -m644 45-source-sans-pro.conf \
    "$pkgdir"/etc/fonts/conf.avail/45-source-sans-pro.conf
  install -m644 90-tt-source-sans-pro.conf \
    "$pkgdir"/etc/fonts/conf.avail/90-tt-source-sans-pro.conf

  cd "$pkgdir"/etc/fonts/conf.d
  ln -s ../conf.avail/45-source-sans-pro.conf .
  ln -s ../conf.avail/90-tt-source-sans-pro.conf .
}
