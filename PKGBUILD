# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=firefox-extension-vimfx
_file=294536
pkgver=0.5.17.1
pkgrel=1
pkgdesc="Introduces Vim-style keyboard shortcuts for browsing and navigation without using the mouse."
arch=('any')
url="https://github.com/akhodakivskiy/VimFx"
license=('MIT')
depends=('firefox>=29.0')
source=(https://addons.mozilla.org/firefox/downloads/file/$_file/vimfx-$pkgver.xpi
        LICENSE)
sha1sums=('b0ae4536be1b7bfbb200585ce07caaaa9687d97a'
          'f1eaf939b37946dea611a5d55ef4784306c70a53')

package() {
  cd "$srcdir"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"
  find . -type f -exec install -Dm644 '{}' "$dstdir/{}" \;

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
