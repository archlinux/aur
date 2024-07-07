# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=MeeraNew
pkgname=rit-${_UpstreamPkgName,,}-font
pkgver=1.6
pkgrel=1
pkgdesc="Sans serif font for Malayalam"
url="https://gitlab.com/rit-fonts/${_UpstreamPkgName}"
arch=(any)
license=(custom:SIL)
makedepends=(fontforge git python python-fonttools python-cffsubr)
source=("${url}/-/archive/${pkgver}/${_UpstreamPkgName}-${pkgver}.tar.bz2")
sha256sums=('6e9b30bf38229a6e519d08bf1858e03168ba0dcdf4b79432d6462bbb2fc3be74')

build() {
  make -C ${_UpstreamPkgName}-${pkgver} otf
}

package() {
  cd "${srcdir}/${_UpstreamPkgName}-${pkgver}"
  install -Dm 644 -t "${pkgdir}/usr/share/fonts/${_UpstreamPkgName}" fonts/otf/*.otf
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CHANGELOG.md
  install -Dm 644 -t "${pkgdir}/usr/share/fontconfig/conf.avail" meta/65-meera-new-fonts.conf
  install -d "$pkgdir/usr/share/fontconfig/conf.default"
  ln -s ../conf.avail/65-meera-new-fonts.conf "$pkgdir/usr/share/fontconfig/conf.default/65-meera-new-fonts.conf"
}

# vim:set sw=2 et:

