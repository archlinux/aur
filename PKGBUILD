pkgname='vrrtest-git'
pkgver=r33.79bd724
pkgrel=1
pkgdesc='A very small utility to test variable refresh rate.'
arch=('x86_64')
url='https://github.com/Nixola/VRRTest'
license=('zlib')
makedepends=('git')
depends=('love')
source=(
  'vrrtest_src::git+https://github.com/Nixola/VRRTest.git'
  'vrrtest'
  'vrrtest.desktop'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/vrrtest_src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/opt/vrrtest"
  cp -r "$srcdir/vrrtest_src/." "$pkgdir/opt/vrrtest"
  rm -rf "$pkgdir/opt/vrrtest/.git"

  install -Dm755 -t "$pkgdir/usr/bin" vrrtest

  install -D -m644 "$srcdir/vrrtest.desktop" "$pkgdir/usr/share/applications/vrrtest.desktop"
}
