# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <@zoho.com>

pkgname=otf-tex-gyre-ib
pkgver=2.005
pkgrel=8
depends=('fontconfig')
pkgdesc="The TeX Gyre (TG) Collection of Fonts"
groups=('infinality-bundle-fonts')
url="https://www.gust.org.pl/projects/e-foundry/tex-gyre/"
arch=('any')
license=('custom:GFL')
conflicts=('otf-texgyre' 'tex-gyre-fonts' 't1-tex-gyre-ib')
replaces=('t1-tex-gyre-ib')
source=("https://www.gust.org.pl/projects/e-foundry/tex-gyre/whole/tg-${pkgver}otf.zip"
        GFL.txt
        45-tex-gyre.conf
        90-non-tt-tex-gyre.conf)
sha1sums=('beba3be8c9ed56327dafd80455baaa51aa0b1406'
          '2d8edd88388d9a43eeb041bc9f788e0d863ce7be'
          '9938b2724132a0c2c1255e2a759b7751f718e4ba'
          'b9a1329700fe64a10b5c1d91c3acb5b17cb8e885')

package(){
  cd "${srcdir}"

  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 GFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-tex-gyre.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-tex-gyre.conf
  install -m644 90-non-tt-tex-gyre.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-non-tt-tex-gyre.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-tex-gyre.conf .
  ln -s ../conf.avail/90-non-tt-tex-gyre.conf .
}
