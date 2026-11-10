# Maintainer: Sebastian Arrieta <sarrietav.dev@gmail.com>
#
# This is the PKGBUILD pushed to the AUR as `sift-reader`. It builds from the
# tagged release at github.com/sarrietav-dev/sift. Copy this file, and the
# .SRCINFO generated next to it, into the AUR git repository.
pkgname=sift-reader
pkgver=0.1.1
pkgrel=2
pkgdesc='Read the web, aloud, with Kokoro'
arch=('x86_64' 'aarch64')
url='https://github.com/sarrietav-dev/sift'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-webengine' 'qt6-wayland')
makedepends=('git' 'gcc' 'make')
conflicts=('sift' 'sift-bin' 'sift-git' 'sift-reader-bin')
options=('!debug')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/sift"
  ./bin/build
}

package() {
  cd "$srcdir/sift"
  install -Dm755 build/sift "$pkgdir/usr/bin/sift"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES/defuddle.txt "$pkgdir/usr/share/licenses/$pkgname/defuddle.txt"
  install -Dm644 pkgbuild/sift.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sift.svg"
  install -Dm644 pkgbuild/sift.desktop "$pkgdir/usr/share/applications/sift.desktop"
}
