# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=zfs-undelete-git
_pkgname=zfs-undelete
pkgver=0.1.0.r10.g1374933
pkgrel=1
pkgdesc='easy-to-use CLI tool to recover files from zfs snapshots'
url="https://github.com/arctic-penguin/$_pkgname"
source=("git+https://github.com/arctic-penguin/${_pkgname}")
arch=('any')
license=('GPL3')
depends=('zfs-utils')
makedepends=('rust')
sha256sums=(SKIP)

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 target/release/zfs-undelete "${pkgdir}/usr/bin/zfs-undelete"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
