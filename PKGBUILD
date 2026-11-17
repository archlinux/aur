# SPDX-License-Identifier: Apache-2.0
#
# The package of the AUR for ahk.
#
# It installs the prebuilt x86_64 Linux archive of the release, pinned to
# the SHA256 of the file it names. The sources of the project are at
# https://github.com/danalec/ahk, and the archive is the one the CI builds
# and smokes.
pkgname=ahk
pkgver=0.5.0
pkgrel=1
pkgdesc="An AutoHotkey interpreter written in Rust, with a desktop backend for driving a Linux machine"
arch=('x86_64')
url="https://github.com/danalec/ahk"
license=('Apache-2.0')
depends=('glibc')
optdepends=('python: the helper of the desktop, for the keyboard, the pointer and the screen')
provides=('ahk')
conflicts=('ahk-git')
options=('!strip')
source=("$pkgname-v$pkgver-x86_64-linux-gnu.tar.gz::https://github.com/danalec/ahk/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=('4960b3f15537e61550fb517eaa95896879193b1356d41b287bfb12ce4f325fdc')

package() {
  cd "$pkgname-v$pkgver-x86_64-linux-gnu"
  install -Dm755 ahk "$pkgdir/usr/bin/ahk"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The icons of the theme: the archive of 0.3.2 has none, and the ones
  # after it carry the set of PNGs that the theme of the desktop takes
  # (`share/icons/hicolor/<size>x<size>/apps/ahk.png`).
  if [ -d share/icons ]; then
    cp -r share/icons "$pkgdir/usr/share/"
  fi
  # The entry of the menu: it names the icon of the theme.
  if [ -f share/applications/ahk.desktop ]; then
    install -Dm644 share/applications/ahk.desktop "$pkgdir/usr/share/applications/ahk.desktop"
  fi
}
