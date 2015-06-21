# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com> 
pkgname=unrarall-git
pkgver=0.0.0
pkgrel=2
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
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -Dm755 "$srcdir/unrarall/unrarall" "$pkgdir/usr/bin/unrarall"
}
