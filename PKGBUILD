# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: erk <valdemarerk@gmail.com>

pkgname=gravity-lang-git
pkgdesc="Gravity Programming Language."
pkgver=0.8.1.r11.g73d8837
pkgrel=1
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://marcobambini.github.io/gravity/"
license=(MIT)
makedepends=(git)
conflicts=(gravity-lang)
provides=(gravity-lang)
source=("${pkgname%-git}::git+https://github.com/marcobambini/gravity.git")
sha256sums=(SKIP)

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make gravity
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "gravity" "$pkgdir/usr/bin/gravity"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
