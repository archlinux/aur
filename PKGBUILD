# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
pkgname=surfn-icons-git
_pkgname=Surfn
pkgver=9.7.1.r31.gb45e8c22
pkgrel=1
epoch=1
pkgdesc='Surfn, a colourful icon theme'
arch=('any')
url='https://github.com/erikdubois/Surfn'
license=('custom:CC BY-NC-SA 4.0')
makedepends=('git')
options=(!strip !emptydirs)
source=('Surfn::git+https://github.com/erikdubois/Surfn.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}/surfn-icons"

  # Delete all build scripts
  find . -type f -name "*.sh" -delete

  install -dm 755 "${pkgdir}/usr/share/icons/"
  cp -r * "${pkgdir}/usr/share/icons/"

  install -Dm 644 "Surfn/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et ts=2 sw=2 tw=79:
