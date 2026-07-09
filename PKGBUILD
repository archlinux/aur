pkgname='vrrtest-git'
pkgver=r44.eca8bbf
pkgrel=1
pkgdesc='A very small utility to test variable refresh rate.'
arch=('x86_64')
url='https://github.com/Nixola/VRRTest'
license=('Zlib')
makedepends=('git')
depends=('love')
provides=('vrrtest')
conflicts=('vrrtest')
source=(
  'vrrtest_src::git+https://github.com/Nixola/VRRTest.git'
  'vrrtest'
  'vrrtest.desktop'
)
sha256sums=('SKIP'
            '08816b89cfdde46275994e778cba0c062e444757607e5fe16d3a3e1762c0d2fc'
            'e4535c94934b81c55ee0667b554909c1d489fe0693d7db73615c5916c32f9bc0')

pkgver() {
  cd "$srcdir/vrrtest_src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/vrrtest/"
  cp -r "$srcdir/vrrtest_src/src/." "$pkgdir/usr/share/vrrtest"

  install -Dm644 "$srcdir/vrrtest_src/dist/vrrtest.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/vrrtest.svg"

  install -Dm755 -t "$pkgdir/usr/bin" vrrtest

  install -D -m644 "$srcdir/vrrtest.desktop" "$pkgdir/usr/share/applications/vrrtest.desktop"
}
