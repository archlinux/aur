# Contributor: Ivan Zenin <i.zenin@gmx.com>

pkgname=imlib2-heic-git
pkgver=latest
pkgrel=1
pkgdesc="HEIC/HEIF decoder for imlib2 (development version)"
arch=('x86_64')
url="https://github.com/vi/imlib2-heic"
license=('BSD')
depends=('imlib2' 'libheif')
makedepends=('git')
source=("git+https://github.com/vi/imlib2-heic.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/imlib-heic
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build()
{
  cd ${pkgname}
  make
}

package()
{
  cd ${pkgname}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make install DESTDIR=${pkgdir}
}
