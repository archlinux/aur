# Maintainer: Bob Allred  <balinbob + gmail.com>
pkgname=terminator-plugins-bgz-rtae-git
pkgver=r5.94964ae
pkgrel=1
pkgdesc='backgroundzoom & appearanceeditor, plugins for customizing terminator terminal emulator'
arch=('any')
url='https://github.com/balinbob/terminator-plugins'
license=('GPL2')
depends=('terminator')
makedepends=('git')
source=('git+https://github.com/balinbob/terminator-plugins')
md5sums=('SKIP')
install="${pkgname}.install"
_gitname="terminator-plugins"

pkgver () {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 ae.py setter.py my_plugin.py -t "${pkgdir}/usr/lib/python2.7/site-packages/terminatorlib/plugins" 
  install -Dm644 INSTALL README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
