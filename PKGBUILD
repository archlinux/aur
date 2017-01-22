pkgname=unrarall-git
pkgver=0.4.4.r133.8a67a83
pkgrel=1
pkgdesc="unrarall is a utility to unrar and clean up various files (.e.g. rar files)."
arch=('any')
url="https://github.com/arfoll/unrarall"
license=('GPL3')
optdepends=('unrar: unrar support'
            '7z: 7z support'
            'cksfv: CRC check before extracting')
makedepends=('git')
conflicts=('unrarall')
provides=('unrarall')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=('git+https://github.com/arfoll/unrarall.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/unrarall"
  _ver="$(cat unrarall|grep UNRARALL_VERSION=|grep -o "[[:digit:]]*"|paste -sd'.')"
  # Use the tag of the last commit
  echo "$_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/unrarall/unrarall" "$pkgdir/usr/bin/unrarall"
}
