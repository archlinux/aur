# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=RIT-Rachana
pkgname=${_UpstreamPkgName,,}-fonts
pkgver=1.4.7
pkgrel=1
pkgdesc="Traditional orthography opentype font with definitive character set for Malayalam"
url="https://gitlab.com/rit-fonts/${_UpstreamPkgName}"
arch=(any)
license=(custom:SIL)
makedepends=(fontforge git python python-fonttools python-cffsubr)
source=("${url}/-/archive/${pkgver}/${_UpstreamPkgName}-${pkgver}.tar.bz2")
sha256sums=('494a48d040fe20d773c3c102c36f65024c3a8827c899665f6283c824a5a610c3')

build() {
  make -C ${_UpstreamPkgName}-${pkgver} otf
}

package() {
  cd "${srcdir}/${_UpstreamPkgName}-${pkgver}"
  install -Dm 644 -t "${pkgdir}/usr/share/fonts/${_UpstreamPkgName}" fonts/otf/*.otf
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CHANGELOG.md
  install -Dm 644 -t "${pkgdir}/usr/share/fontconfig/conf.avail" meta/65-0-rit-rachana-fonts.conf
  install -d "$pkgdir/usr/share/fontconfig/conf.default"
  ln -s ../conf.avail/65-0-rit-rachana-fonts.conf "$pkgdir/usr/share/fontconfig/conf.default/65-0-rit-rachana-fonts.conf"
}

# vim:set sw=2 et:

