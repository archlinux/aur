# Maintainer: Kyle Brown <kdb424@gmail.com>
pkgname=worldedit-git
pkgver=r23.7c05e75
_pkgname=worldedit
pkgrel=1
pkgdesc="Emulating Gentoo’s world files and sets for other package managers."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kdb424/worldedit"
license=('MIT')
depends=(
  'pacman>5'
  'git'
  'sudo'
  'clang')
optdepends=(
  'yay'
)
makedepends=(
  'nim'
  'nimble'
)
conflicts=('worldedit')
provides=('worldedit')
source=("worldedit::git+https://github.com/kdb424/worldedit.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" release
}

package() {
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm 644 completions/worldedit.zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_worldedit"
}

