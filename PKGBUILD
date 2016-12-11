# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo-git
pkgver=r863.d6b4805
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim" "python2-setuptools" "python2-axolotl-git" "python2-cryptography" "python2-qrcode" "python2-future")
makedepends=("git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo')
source=("git+https://dev.gajim.org/gajim/gajim-plugins.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir"/gajim-plugins/omemo
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $srcdir/gajim-plugins/omemo
  rm -r CHANGELOG COPYING
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r ./* ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
