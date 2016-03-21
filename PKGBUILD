# Maintainer: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-git
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
pkgver=1.0.14_20160321183533+fd9ae5d
pkgver() {
  "$srcdir/client/packaging/version.sh" prerelease | sed 's/-/_/g'
}
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse)
makedepends=(go npm git rsync)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release)
source=(
  'git+https://github.com/keybase/client'
  'git+https://github.com/keybase/kbfs-beta'
)
md5sums=('SKIP' 'SKIP')
install=keybase.install

build() {
  cp -r "$srcdir/kbfs-beta/kbfs" "$srcdir/kbfs"
  client/packaging/linux/build_binaries.sh prerelease build_dir
}

package() {
  if [ "$CARCH" = x86_64 ] ; then
    debian_arch=amd64
  else
    debian_arch=i386
  fi
  cp -r "$srcdir/build_dir/binaries/$debian_arch"/* "$pkgdir"
}
