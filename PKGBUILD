# Maintainer: Jörn Hofmann <joernhofmann@web.de>
# Contributor: Pedro Veloso <pedro.n.veloso at gmail dot com>
# Contributor: Jonathan Zacsh <j@zac.sh>

pkgname=pidcat-python3-git
pkgver=2.1.0.r16.61cd1ee
pkgrel=1
pkgdesc="Pidcat is a colored logcat script with improved readability that only shows log entries for a specific Android package."
arch=('any')
url="https://github.com/JakeWharton/pidcat"
license=('Apache')
depends=(android-tools python)
conflicts=('pidcat-git' 'pidcat')
provides=('pidcat-git' 'pidcat')

source=("git+$url.git" "pidcat.patch")
sha256sums=(
  SKIP
  62dab1751881911585c934c1779fba8785146b1b34168d52eb1b64d3de64e017
)

build() {
  cd "$srcdir/${pkgname%-python3-git}"
  patch -N pidcat.py "$srcdir"/pidcat.patch
}

package() {
  cd "$srcdir/${pkgname%-python3-git}"

  # Install license
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.txt

  # Install run script
  install -Dm755 pidcat.py "$pkgdir"/usr/bin/pidcat
}

pkgver() {
  # per https://gitlab.archlinux.org/pacman/pacman/blob/edce7555a6b7410d1a4da6d27d22383989306ccc/proto/PKGBUILD-vcs.proto#L46
  cd "$srcdir/${pkgname%-python3-git}"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
