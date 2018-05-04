# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=opl3bankeditor-git
_pkgname=OPL3BankEditor
pkgver=1.3.beta.r176.g8b5b03f
pkgrel=1
epoch=
pkgdesc="A small cross-platform editor of the OPL3 FM banks of different formats"
arch=('i686' 'x86_64')
url="https://github.com/Wohlstand/OPL3BankEditor"
license=('GPL3')
groups=()
depends=('qt5-multimedia')
makedepends=()
checkdepends=()
optdepends=()
provides=("opl3bankeditor")
conflicts=("opl3bankeditor")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Wohlstand/${_pkgname}.git"
        'opl3_bank_editor.desktop')
noextract=()
md5sums=('SKIP'
         "8eddaea4568da3d1b441473951d64116")
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$_pkgname"
  qmake
  make
}

package() {
  cd "$_pkgname"
  install -D -m755 bin-debug/opl3_bank_editor "$pkgdir"/usr/bin/opl3_bank_editor
  install -D -m644 src/resources/opl3_48.png "$pkgdir"/usr/share/pixmaps/opl3_bank_editor.png
  install -D -m644 "$srcdir"/opl3_bank_editor.desktop "$pkgdir"/usr/share/applications/opl3_bank_editor.desktop
}
