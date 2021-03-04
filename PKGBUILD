# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact-git
pkgver=r145.c961924
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilyazzz/LACT"
makedepends=("rust" "git")
depends=("gtk3" "hwids")
arch=("any")
backup=('etc/lact.json')
source=("git+https://github.com/ilyazzz/LACT.git")
sha512sums=("SKIP")

pkgver() {
  cd LACT
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd LACT
    cargo build --release 
}

package() {
    cd LACT
    install -Dm644 lactd.service "${pkgdir}"/usr/lib/systemd/system/lactd.service
    install -Dm644 lact.desktop "${pkgdir}"/usr/share/applications/lact.desktop
    install -Dm755 target/release/daemon "${pkgdir}"/usr/bin/lact-daemon
    install -Dm755 target/release/gui "${pkgdir}"/usr/bin/lact-gui
}
