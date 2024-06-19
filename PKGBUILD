# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=makeimg
pkgver=0.14.0
pkgrel=1
pkgdesc='Declarative way to build Linux system images'
arch=(any)
url='https://sr.ht/~bitfehler/makeimg'
license=(GPL-2.0-or-later)
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
sha512sums=('997d06ca48741d87306635cd2f7f71605f507c289b0d78e4cefebb6604b150cec4f8df3119c8ed8b7132c0bec4fd502570465d495c6ca357e2bad81981be3f1b')

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
  install -d examples "${pkgdir}/usr/share/doc/makeimg"
}

# vim: ts=2 sw=2 et
