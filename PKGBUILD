# Maintainer: Brandon Carpenter [hashstat (at) yahoo (dot) com]
pkgname=rhythmbox-equalizer
_gitrev=6e706193ed796f8bcf84043ccfe270586390287f
pkgver=17.10.11.${_gitrev::8}
pkgrel=1
pkgdesc="10 band graphical equalizer for Rhythmbox"
arch=(any)
url=http://luqmana.github.io/rhythmbox-plugins
license=(unknown)
depends=(gconf python rhythmbox)
source=(rhythmbox-plugins-$pkgver.tar.gz::https://github.com/luqmana/rhythmbox-plugins/archive/$_gitrev.tar.gz)
md5sums=(5127a5167d766bd8137e4f4cb577b03f)

package() {
  local plugindir="$pkgdir"/usr/lib/rhythmbox/plugins/equalizer
  local uidir="$pkgdir"/usr/share/rhythmbox/plugins/equalizer

  install -d "$plugindir" "$uidir"

  cd rhythmbox-plugins-$_gitrev/equalizer
  install -m 0644 equalizer.plugin3 "$plugindir"/equalizer.plugin
  install -m 0644 *.py "$plugindir"
  install -m 0644 *.ui "$uidir"

  cd "$plugindir"
  python -m compileall *.py
  python -O -m compileall *.py
}

# vim:set ts=2 sw=2 et:
