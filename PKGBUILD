# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=makeimg
pkgver=v0.2.0
pkgrel=2
pkgdesc='Declarative way to build Arch or Alpine Linux images'
arch=(any)
url='https://sr.ht/~bitfehler/makeimg'
license=(GPL2)
depends=(
  'coreutils'
  'tar'
  'util-linux'
)
optdepends=(
  'apk-tools: for building Alpine images'
  'arch-install-scripts: for building Arch images'
  'parted: for building disk images'
  'patch: for applying patches'
)
makedepends=(
  asciidoc
  make
)
provides=('makeimg')
conflicts=('makeimg-git')

source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~bitfehler/makeimg/archive/v0.2.0.tar.gz")
sha512sums=('637913d5de2cc6897a2c81378520e54dce6578673d40fa74646312c57e88e35f6d1d2bdfc032d8f089f85edd515a6d1d5c984f6362c592bfe7545ad1d00295d2')

build() {
  cd "${pkgname}-${pkgver}"
  make man
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 makeimg -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/makeimg"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/makeimg"
  install -Dm644 doc/makeimg.1.gz -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 doc/IMGBUILD.5.gz -t "${pkgdir}/usr/share/man/man5/"
}

# vim: ts=2 sw=2 et
