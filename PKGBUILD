# Maintainer:
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

_pkgname="osu-wine"
pkgname="$_pkgname-git"
pkgver=1.0.r2.g062ad51
pkgrel=1
pkgdesc="osu!"
url="https://github.com/Nefelim4ag/osu-wine"
license=('GPL3')
arch=('any')

makedepends=('git')
optdepends=(
  'lib32-libpulse: for audio'
  'lib32-gnutls'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

install="$pkgname.install"
backup=("etc/osu-wine.conf")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  depends+=(
    'bash'
    'hicolor-icon-theme'
    'wget'
    'wine'
    'winetricks'
  )

  cd "$_pkgsrc"
  make install PREFIX="$pkgdir"
}
