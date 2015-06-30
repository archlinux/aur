# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419
# Contributor: Boohbah <boohbah at gmail dot com>

pkgname=rkt-git
pkgver=0.5.6.r22.g2440b4a
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
makedepends=('cpio' 'go' 'squashfs-tools')
provides=('rkt')
replaces=('rocket' 'rkt')
conflicts=('rocket' 'rkt')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  RKT_STAGE1_IMAGE=/usr/share/rkt/stage1.aci ./build
}

package() {
  cd "$pkgname"
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm644 bin/stage1.aci "$pkgdir/usr/share/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
