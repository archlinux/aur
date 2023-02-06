# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=cmvnd-fonts
_pkgname=${pkgname##cmvnd-}
pkgver=1.2.0
pkgrel=1
pkgdesc="tiny bitmap fonts"
arch=('any')
license=('GPL3')
depends=('xorg-bdftopcf')
url="https://github.com/cmvnd/fonts"

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('ed2bf5aa6e08fed2bb2940d83d1edda26b6c81f77886bdf29136d311c4dafeec')

build() {
  cd "${_pkgname}-${pkgver}"

  for f in *.bdf spectrum-fonts/*.bdf; do
    bdftopcf $f | gzip -9 > ${f%%.bdf}.pcf.gz
  done
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/misc" *.pcf.gz *.otb spectrum-fonts/*.pcf.gz spectrum-fonts/*.otb

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
