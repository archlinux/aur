# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Whitney Marshall <whitney.marshall@gmail.com>
# Contributor: McNoggins <Gagnon88 (at) gmail (dot) com>
# Contributor: Hielke Christian Braun <hcb@unco.de>

pkgname=go-mtpfs-git
pkgver=20200111
pkgrel=1
pkgdesc="Simple tool for viewing MTP devices as FUSE filesystems"
arch=('x86_64' 'i686')
url="http://github.com/hanwen/go-mtpfs"
license=('BSD')
depends=('libusb' 'fuse')
makedepends=('go>=1.3.0' 'git')
options=('!strip' '!emptydirs')
source=("git+https://github.com/hanwen/go-mtpfs.git")
md5sums=("SKIP")

pkgver() {
  # Use date of latest commit for pkgver
  cd "$srcdir/go-mtpfs"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/go-mtpfs"
  go build ./
}

package() {
  install -Dm644 "$srcdir/go-mtpfs/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/go-mtpfs/go-mtpfs" "$pkgdir/usr/bin/go-mtpfs"
}
