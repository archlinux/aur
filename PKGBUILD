# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=makeimg
pkgver=0.12.0
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
sha512sums=('47babe89625d4c2271d1c31e4cafc61652ff58e05eb3c22d819b45e219a1e71b67d67eb742f287a724575bb14b7935ade67e18547c8da5b2bd95ecdc01bcb805')

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
