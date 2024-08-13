# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan-git
pkgver=r2201.a766983b
pkgrel=1
pkgdesc="Web browser for your terminal"
arch=(x86_64)
url="https://git.sr.ht/~bptato/${pkgname%-git}"
license=(Unlicense)
depends=(
  bash
  glibc
  libseccomp
  ncurses
  openssl
)
makedepends=(
  git
  nim
  pandoc-cli
)
optdepends=('termcap: to use display computer terminals in a device-independent manner')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  make submodule
}

build() {
  cd ${pkgname%-git}
  make LIBEXECDIR=/usr/lib/${pkgname%-git}
}

package() {
  cd ${pkgname%-git}
  install -vDm644 UNLICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}/
  make DESTDIR="$pkgdir" PREFIX="/usr" LIBEXECDIR="$pkgdir"/usr/lib/${pkgname%-git} install
}
