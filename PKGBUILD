# Maintainer: Kyle Brown <kdb424@gmail.com>
pkgname=pmm-git
pkgver=r33.81af692
_pkgname=pmm
pkgrel=1
pkgdesc="Emulating Gentoo’s world files and sets for other package managers."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kdb424/pmm"
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
conflicts=('pmm')
provides=('pmm')
source=("pmm::git+https://github.com/kdb424/pmm.git#branch=main")
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
  install -Dm 644 completions/pmm.zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_pmm"
}

