# Maintainer:
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgname="jpeg2png"
pkgname="$_pkgname-git"
pkgver=1.01.r5.g7ae6e42
pkgrel=1
pkgdesc='Silky smooth JPEG decoder'
url="https://github.com/ImageProcessing-ElectronicPublications/jpeg2png"
license=('GPL-3.0-or-later')
arch=('x86_64' 'i686')

depends=(
  'libjpeg'
  'libpng'
)
makedepends=(
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="ipep.jpeg2png"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
