# Maintainer: Brendan Van Hook <brendan at vastactive dot com>
_pkgname=maxio
pkgname=${_pkgname}-git
pkgver=r46.7cc593a
pkgrel=1
pkgdesc='Companion daemon for the reMarkable paper tablet.'
arch=('any')
url='https://github.com/reHackable/maxio'
license=('GPLv3')
depends=('openssh' 'pdftk' 'imagemagick' 'python')
optdepends=(
	'librsvg: to avoid rasterizing of lines'
	'ghostscript: to account for original pdf size'
	'poppler: to account for original pdf size')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/reHackable/maxio")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}/${_pkgname}/tools"
  install -D -m755 exportNotebook "${pkgdir}/usr/bin/exportNotebook"
  install -D -m755 rM2svg "${pkgdir}/usr/bin/rM2svg"
}
