# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419

pkgname=rkt
pkgver=0.7.0
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
makedepends=('cpio' 'go' 'squashfs-tools')
provides=('rkt')
replaces=('rocket')
conflicts=('rocket')
source=("https://github.com/coreos/rkt/archive/v${pkgver}.tar.gz")
sha256sums=('1e5996c9c26a69f107d9d4f8dd2a3e55ca3a9b8491ecbd9fe2dfe423c7c384ce')

build() {
  cd "${pkgname}-${pkgver}"
  RKT_STAGE1_IMAGE=/usr/share/rkt/stage1.aci ./build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm644 bin/stage1.aci "$pkgdir/usr/share/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
