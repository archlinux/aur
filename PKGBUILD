# Maintainer: Philipp Classen <philipp at posteo.de>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>
# Previous maintainer: Bjoern Franke <bjo at nord-west.org>
pkgname=stapler
pkgver=1.0.0
pkgrel=1
pkgdesc="A small utility making use of the pypdf library to provide a (somewhat) lighter alternative to pdftk"
arch=('any')
url="https://github.com/hellerbarde/stapler"
license=('BSD')
depends=('python' 'python-pypdf2')
conflicts=('stapler-git')

source=("https://github.com/hellerbarde/stapler/archive/$pkgver.tar.gz")
sha256sums=('011f0d82a1c7a20a600a8dbe4fb3076129ec1df3a2214054ae7954ab3a85ed51')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -rv "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}"
  install -d ${pkgdir}/usr/bin

  printf "#!/usr/bin/env python
from staplelib import stapler
stapler.main()
" > "${pkgdir}/opt/${pkgname}/${pkgname}"
  chmod a+x "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
