# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname='amdgpu-profile-switcher-git'
pkgver=0.r113.57b3695
pkgrel=1
pkgdesc='amdgpu-profile-switcher is a simple tool that automatically switches profiles for AMDGPU, and it also allows for advanced settings such as overclocking, undervolting, and fan control'
arch=('x86_64')
url='https://github.com/Umio-Yasuno/amdgpu-profile-switcher'
depends=()
makedepends=(
  'rust'
)

backup=(
  'etc/amdgpu-profile-switcher.ron'
)
install=amdgpu-profile-switcher.install

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/amdgpu-profile-switcher"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/amdgpu-profile-switcher"
  cargo build --release
}

package() {
  cd "$srcdir/amdgpu-profile-switcher"
  install -Dm755 "target/release/amdgpu-profile-switcher" "$pkgdir/usr/bin/amdgpu-profile-switcher"
  install -Dm644 "amdgpu-profile-switcher.ron" "$pkgdir/etc/amdgpu-profile-switcher.ron"
  install -Dm644 "debian/amdgpu-profile-switcher.service" "$pkgdir/usr/lib/systemd/system/amdgpu-profile-switcher.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/amdgpu-profile-switcher/README.md"
}
