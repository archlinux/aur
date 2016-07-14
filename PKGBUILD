# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=keymap-us-capslock-backspace
pkgver=1.0.0
pkgrel=1
pkgdesc="Provides US keymap with capslock key remapped to backspace"
arch=('any')
makedepends=('kbd')
url="https://github.com/atweiden"
license=('UNLICENSE')
install=keymap-us-capslock-backspace.install

prepare() {
  cd "$srcdir"

  msg2 'Fetching us keymap...'
  cp -dpr --no-preserve=ownership \
    /usr/share/kbd/keymaps/i386/qwerty/us.map.gz us-capslock-backspace.map.gz

  msg2 'Decompressing us keymap...'
  gunzip us-capslock-backspace.map.gz
}

build() {
  cd "$srcdir"

  msg2 'Remapping capslock backspace key in keymap...'
  sed \
    -i \
    -e '1s/us/us-capslock-backspace/' \
    -e 's/\(keycode\s*58\s*=\s*\).*/\1Delete/' \
    us-capslock-backspace.map

  msg2 'Compressing keymap...'
  gzip us-capslock-backspace.map
}

package() {
  cd "$srcdir"

  msg2 'Installing keymap us-capslock-backspace...'
  install -Dm 644 us-capslock-backspace.map.gz \
          -t "$pkgdir/usr/share/kbd/keymaps/i386/qwerty"
}
