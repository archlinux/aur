# Maintainer: tarball <bootctl@gmail.com>

pkgname=wcd
pkgver=6.0.7
pkgrel=1
pkgdesc='A command-line program to change directory fast'
url='https://waterlander.net/wcd'
arch=(x86_64 aarch64 armv7h)
license=(GPL-2.0-only)
depends=(glibc ncurses)

source=(
  $url/files/wcd-$pkgver.tar.gz{,.asc}
  wcd.sh
)
validpgpkeys=(
  'F8F1BEA490496A09CCA328CC38C1F572B12725BE' # Erwin Waterlander (Foute boel) <waterlan@xs4all.nl>
)
sha256sums=('91a63282a15e5df97b6797075d4b7600ad433c3216f4c76e538009363e857a3f'
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
