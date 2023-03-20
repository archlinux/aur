# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=makeimg
pkgver=0.6.0
pkgrel=1
pkgdesc='Declarative way to build Linux system images'
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
  'debootstrap: for building Debian images'
  'parted: for building disk images'
  'patch: for applying patches'
)
makedepends=(
  scdoc
  make
)
provides=('makeimg')
conflicts=('makeimg-git')

source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~bitfehler/makeimg/archive/v${pkgver}.tar.gz")
sha512sums=('8cb3410d72644707d19fabeb1457eeb89c19a769866bcdb845c374ca06e10b606e322d62e1c7be4fad3154fec47384d465baf564619e72230cf6413e0a4771ed')

build() {
  cd "${pkgname}-v${pkgver}"
  make man
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -Dm755 makeimg -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/makeimg"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/makeimg"
  install -Dm644 doc/makeimg.1.gz -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 doc/IMGBUILD.5.gz -t "${pkgdir}/usr/share/man/man5/"
}

# vim: ts=2 sw=2 et
