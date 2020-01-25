# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo-git
pkgver=omemo_2.5.8.r498.ge3d75d8
pkgrel=1
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
makedepends=('git')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo')
source=('git+https://dev.gajim.org/gajim/gajim-plugins.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/gajim-plugins/omemo"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/gajim-plugins/omemo"
  _site="$(python -c 'import site; print(site.getsitepackages()[0])')"

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d "${pkgdir}${_site}/gajim/data/plugins/omemo"
  cp -r * "${pkgdir}${_site}/gajim/data/plugins/omemo/"
}

# vim:set ts=2 sw=2 et:
