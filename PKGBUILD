# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=firefox-extension-vimfx
_file=368962
pkgver=0.6.2
pkgrel=1
pkgdesc="Introduces Vim-style keyboard shortcuts for browsing and navigation without using the mouse."
arch=('any')
url="https://github.com/akhodakivskiy/VimFx"
license=('MIT')
depends=('firefox>=40.0')
source=(https://addons.mozilla.org/firefox/downloads/file/$_file/vimfx-$pkgver.xpi
        LICENSE)
sha1sums=('b2f8b6a19b6596d70c7395b1bd637bcb6bf5b652'
          'f1eaf939b37946dea611a5d55ef4784306c70a53')

package() {
  cd "$srcdir"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"
  find . -type f -exec install -Dm644 '{}' "$dstdir/{}" \;

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
