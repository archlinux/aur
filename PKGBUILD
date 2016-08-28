# Software Author: Alexey Smirnov <alexey.smirnov@gmx.com>
# Package Maintainer: Philip Stark <git@codechaos.ch>

pkgname=deadbeef-plugin-gvfs
pkgver=d1851a # the first 6 characters of the git revision.
pkgrel=1
pkgdesc="A gvfs plugin for the DeaDBeeF audio player"
arch=('i686' 'x86_64')
url="https://github.com/asv/deadbeef-gvfs"
license=('MIT')
depends=('deadbeef>=0.6' 'glib2')
backup=()
source=("https://github.com/asv/deadbeef-gvfs/archive/${pkgver}.zip")
md5sums=('179d5c47d28b03843637a569e07630c4')

build() {
  cd "${srcdir}/deadbeef-gvfs-${pkgver}"*
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/deadbeef-gvfs-${pkgver}"*
  make DESTDIR="$pkgdir" install

  # Necessary because the MIT license has an individual copyright line.
  install -d "$pkgdir/usr/share/licenses/deadbeef-plugin-gvfs"
  install LICENSE "$pkgdir/usr/share/licenses/deadbeef-plugin-gvfs/LICENSE"
}

# vim:set ts=2 sw=2 et:
