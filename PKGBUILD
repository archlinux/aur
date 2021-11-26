# Maintainer: Jonathan Zacsh <j@zac.sh>

pkgname=pidcat-git
pkgver=2.1.0.r14.0cb1c2c
pkgrel=1
pkgdesc="Pidcat is a colored logcat script with improved readability that only shows log entries for a specific Android package."
arch=('any')
url="https://github.com/JakeWharton/pidcat"
license=('Apache')
depends=(android-tools python2)

source=("git+$url.git" "pidcat.patch")
md5sums=('SKIP' "c9bfb27615710b5ddaaf74cef0042a17")

build() {
  patch -N "$srcdir"/pidcat/pidcat.py pidcat.patch
}

package() {
  # Install license
  install -Dm644 "$srcdir"/pidcat/LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.txt

  # Install run script
  install -Dm755 "$srcdir"/pidcat/pidcat.py "$pkgdir"/usr/bin/pidcat
}

pkgver() {
  # per https://gitlab.archlinux.org/pacman/pacman/blob/edce7555a6b7410d1a4da6d27d22383989306ccc/proto/PKGBUILD-vcs.proto#L46
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
