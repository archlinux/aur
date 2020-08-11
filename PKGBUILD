# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='gnabel-git'
pkgver=r30.57ff9c3
pkgrel=1
pkgdesc='A translation app for GTK environments based on Google Translate'
arch=('any')
depends=(
  'python>=3'
  'python-pyperclip'
  'python-gobject'
  'python-googletrans' # aur only
  'python-gtts' # aur only
  'python-pydub' # aur only
)
makedepends=('git')
provides=('gnabel')
conflicts=('gnabel')
url='https://github.com/gi-lom/gnabel'
license=('GPL-3.0')
source=(
  "gnabel::git+https://github.com/gi-lom/gnabel"
)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/gnabel"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/gnabel"

  msg2 'Installing LICENSE'
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Installing executable'
  install -Dm755 gnabel.py "$pkgdir/usr/bin/gnabel"

  msg2 'Installing desktop file'
  install -Dm755 gnabel.desktop "$pkgdir/usr/share/applications/gnabel.desktop"

  msg2 'Installing icon'
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/gnabel.png"
}
