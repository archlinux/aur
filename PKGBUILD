_fontname=luxi
_basename=font-bh-ttf
pkgname="ttf-${_fontname}"
pkgver=1.0.3
pkgrel=1
pkgdesc='Luxi Truetype fonts'
url='https://xorg.freedesktop.org/releases/individual/font'
license=('custom')
arch=('any')

provides=("${_basename}")
conflicts=(${provides[@]})

source=("${url}/${_basename}-${pkgver}.tar.bz2")
sha256sums=('1b4bea63271b4db0726b5b52c97994c3313b6023510349226908090501abd25f')

package() {
  cd "${srcdir}/${_basename}-${pkgver}"

  # not using upstream `Makefile` because it fails with paths containing spaces
  install -D -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
  install -D -m644 -t "${pkgdir}/usr/share/fontconfig/conf.avail" 42-luxi-mono.conf

  mkdir -p "${pkgdir}/usr/share/fontconfig/conf.default"
  ln -s "../conf.avail/42-luxi-mono.conf" "${pkgdir}/usr/share/fontconfig/conf.default/"

  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
