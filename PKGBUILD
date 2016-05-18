# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com> 
pkgname=unrarall-git
pkgver=0.2.r98.g1bcf008
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
  # Use the tag of the last commit
  git describe --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//'
}

package() {
  install -Dm755 "$srcdir/unrarall/unrarall" "$pkgdir/usr/bin/unrarall"
}
