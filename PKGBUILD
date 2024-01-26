# Maintainer: ox55ff

pkgname=hycov-git
pkgver=0.34.0.1.r95.84b9f00
pkgrel=1
pkgdesc="Hyprland overview mode plugin, a new tile window workflow"
arch=(x86_64)
url="https://github.com/DreamMaoMao/hycov"
license=(MIT)
depends=(
  hyprland
)
makedepends=(
  git
  meson
  ninja
)
provides=(hycov)
conflicts=(hycov)
source=("git+https://github.com/DreamMaoMao/hycov.git")
b2sums=('SKIP')

pkgver() {
  git -C hycov describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd hycov

  meson setup build \
    --prefix     /usr \
    --buildtype  release

  meson compile -C build
}

package() {
  cd hycov

  meson install -C build \
    --destdir "$pkgdir"
}
