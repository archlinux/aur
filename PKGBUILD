# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=makeimg
pkgver=0.10.0
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
sha512sums=('31931d1a4718e180d70590117471af8b757b1504794626a303ce341d253ecf8e38ae906b040156f6c13b84756109b2bf447a46aa0da25d21667b30e847102976')

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
