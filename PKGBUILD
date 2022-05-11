# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=makeimg-git
pkgver=v0.1.0.r3.gb6eb1c7
pkgrel=1
pkgdesc='Declarative way to build Arch Linux images'
arch=(any)
url='https://anemos.io/projects/makeimg/'
license=(GPL2)
depends=(
  'arch-install-scripts'
  'coreutils'
  'devtools'
  'pacman'
  'util-linux'
)
optdepends=(
  'parted: for building disk images'
  'patch: for applying patches'
)
makedepends=(
  asciidoc
  git
  make
)
provides=('makeimg')
conflicts=('makeimg')

source=("${pkgname}::git+https://gitlab.com/anemos-io/makeimg.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make man
}

package() {
  cd "${pkgname}"
  install -Dm755 makeimg -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/makeimg"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/makeimg"
  install -Dm644 doc/makeimg.1.gz -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 doc/IMGBUILD.5.gz -t "${pkgdir}/usr/share/man/man5/"
}

# vim: ts=2 sw=2 et
