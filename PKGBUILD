# Maintainer: tarball <bootctl@gmail.com>

pkgname=wcd
pkgver=6.0.6
pkgrel=1
pkgdesc='A command-line program to change directory fast'
url='https://waterlan.home.xs4all.nl/wcd.html'
arch=(x86_64 aarch64 armv7h)
license=(GPL-2.0-only)
depends=(glibc ncurses)

source=(
  https://waterlan.home.xs4all.nl/wcd/wcd-$pkgver.tar.gz{,.asc}
  wcd.sh
)
validpgpkeys=(
  'F8F1BEA490496A09CCA328CC38C1F572B12725BE' # Erwin Waterlander (Foute boel) <waterlan@xs4all.nl>
)
sha256sums=('c5d1b22aefbb0f142e27b1cddad17021c43034c76103830fb2757387ac593eb1'
            'SKIP'
            '59b19ccded26d9ba356b5e8c435faa6f300d9f36aef1436bb25e2311195aeeed')

build() {
  cd wcd-$pkgver/src
  make
}

package() {
  install -Dm755 wcd.sh "$pkgdir"/etc/profile.d/wcd.sh
  cd wcd-$pkgver/src
  make prefix="$pkgdir/usr" install
}
