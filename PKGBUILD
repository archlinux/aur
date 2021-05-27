# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo-git
pkgver=2.5.10.r769.g0bc3091
pkgrel=1
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim' 'python' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
makedepends=('git')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo')
source=('git+https://dev.gajim.org/gajim/gajim-plugins.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/gajim-plugins/omemo"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/omemo_//;s/-/./g'
}

package() {
  cd "$srcdir/gajim-plugins/omemo"

  _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dm 755 "${pkgdir}${_site}/gajim/data/plugins/omemo"

  rm -r CHANGELOG COPYING
  cp -r * "${pkgdir}${_site}/gajim/data/plugins/omemo/"
}

# vim:set ts=2 sw=2 et:
