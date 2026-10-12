# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=big-bibata-cursor-theme
_pkgname="${pkgname#big-}"
pkgver=20260916
pkgrel=1
pkgdesc="Open source, compact, and material designed cursor set."
arch=('x86_64')
url="https://github.com/big-comm/Bibata_Cursor"
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'librsvg'
  'python'
  'python-clickgen>=2.0.0'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_commit=c2383d5e5c4a3b9266cddb973e7062fd0c451457
source=("git+https://github.com/big-comm/Bibata_Cursor.git#commit=${_commit}")
sha256sums=('e236ded0a0c246db66edd7af597245e7fd245027328c3a90365b21e7dce11161')

pkgver() {
  cd Bibata_Cursor
  git show -s --date=format:'%Y%m%d' --format=%cd
}

prepare() {
  cd Bibata_Cursor
  rm -rf themes
}

build() {
  cd Bibata_Cursor
  python tools/build_linux.py
}

check() {
  cd Bibata_Cursor
  python -m unittest discover -s tests
}

package() {
  cd Bibata_Cursor
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/Bibata-* "$pkgdir/usr/share/icons/"
}
