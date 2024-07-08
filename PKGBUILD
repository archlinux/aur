# Maintainer:
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

_pkgname="boxtron"
pkgname="$_pkgname"
pkgver=0.5.4
pkgrel=1
pkgdesc='Compatibility tool to run DOS games on Steam through native Linux DOSBox'
url="https://github.com/dreamer/boxtron"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'python'
  'dosbox'
  'inotify-tools'
  'timidity++'
)
makedepends=(
  'git'
)
optdepends=(
  'steam: The Steam client'
  'soundfont-fluid: required for MIDI support, but another soundfont can be used'
)

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  # fix hash for tar 1.35
  sed -e 's&c0452d6addcde172b71cac7b339e074f5f13a7ad83f2ee4736d47025dcbc760e&17bf9cedc6e694983eb2a49c2add264b0e84c4efd3b1fba307cfcab5e21843e5&' \
    -i "$_pkgsrc/preconfig.py"
}

check() {
  cd "$_pkgsrc"
  make test || :
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" prefix=/usr install
}
