# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_name="jpeg2png"
pkgname="$_name-git"
pkgver=1.02.r3.g0f86100
pkgrel=1
pkgdesc='Silky smooth JPEG decoder'
url="https://github.com/ThioJoe/jpeg2png"
license=('GPL-3.0-or-later')
arch=('x86_64' 'i686')

depends=('gcc-libs' 'libjpeg-turbo' 'libpng' 'libgomp')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")

_pkgsrc="$_name"
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

