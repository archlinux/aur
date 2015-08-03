# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: Robson Roberto Souza Peixoto <robsonpeixoto@gmail.com>
pkgname=abntex
pkgver=0.9_beta2
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc='LaTeX class for writing documents conforming to ABNT standard (legacy).'
arch=('i686' 'x86_64')
url="http://abntex.sourceforge.net/"
license=('LPPL')
depends=('texlive-core')
install=$pkgname.install
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
md5sums=('4c5bc2d5388ddf03df754072116ab1f8')

package() {
  cd "${srcdir}/${pkgname}-${_pkgver:0:3}"

  # Lyx layout
  install -D -m 644 lyx/layouts/abnt.layout \
    "${pkgdir}/usr/share/lyx/layouts/abnt.layout"

  install -dm755 "${pkgdir}/usr/share/texmf-dist/"

  for subdir in bibtex makeindex tex; do
    cp -r "texmf/${subdir}" "${pkgdir}/usr/share/texmf-dist/"
  done

  cd "${pkgdir}/usr/share/texmf-dist"
  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}
