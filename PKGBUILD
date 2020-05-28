# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-dejavu-ib
pkgver=2.37
pkgrel=2
pkgdesc="Font family based on the Bitstream Vera Fonts with a wider range of characters"
url="http://dejavu-fonts.org/wiki/Main_Page"
arch=('any')
depends=('fontconfig')
groups=('infinality-bundle-fonts')
conflicts=('ttf-dejavu' 't1-dejavu-ib')
provides=('ttf-font' 'ttf-dejavu' 'dejavu-ib')
replaces=('ttf-dejavu')
license=('custom')
source=('https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-2.37.tar.bz2'
        '45-dejavu.conf'
        '90-tt-dejavu.conf')
sha512sums=('bafa39321021097432777f0825d700190c23f917d754a4504722cd8946716c22c083836294dab7f3ae7cf20af63c4d0944f3423bf4aa25dbca562d1f30e00654'
            'df82fea7ad6c58edcc20c960fd2de9d49c70e23f9e63180b063c848a6f0d5592e2ce31dc0dc4a0b5abc8e682393c827c96b4a9da9203974672ebd3a77e5b9fc3'
            'bc12705369050739143eda6a2dadaada954112ea262bd297a4823b31861f3da0f61e17ad6fb61226caea16323c3bc9cd88e8b0e60f61b2af6d245af885a4399c')

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

