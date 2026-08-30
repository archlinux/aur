# Maintainer: Hiro <31057166+HiroGitea@users.noreply.github.com>
pkgname=ksystemstats-infiniband-git
_pkgname=ksystemstats-infiniband
pkgver=r10.72a24ff
pkgrel=1
pkgdesc="KDE System Monitor sensor plugin exposing InfiniBand port counters (RDMA-aware) (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/HiroGitea/ksystemstats-infiniband"
license=('GPL-2.0-or-later')
depends=('libksysguard' 'kcoreaddons' 'qt6-base')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
