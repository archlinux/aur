# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact-git
pkgver=r168.e9fd31f
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application (git version)"
url="https://github.com/ilyazzz/LACT"
makedepends=("rust" "git")
depends=("gtk3" "hwdata")
arch=("x86_64" "aarch64")
backup=('etc/lact.json')
source=("git+https://github.com/ilyazzz/LACT.git" "lactd.service" "lact.desktop")
sha512sums=("SKIP"
     "SKIP" "SKIP")

pkgver() {
  cd LACT
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd LACT
    cargo build --release 
}

package() {
    install -Dm644 lactd.service "${pkgdir}"/usr/lib/systemd/system/lactd.service
    install -Dm644 lact.desktop "${pkgdir}"/usr/share/applications/lact.desktop
    cd LACT
    install -Dm755 target/release/daemon "${pkgdir}"/usr/bin/lact-daemon
    install -Dm755 target/release/cli "${pkgdir}"/usr/bin/lact-cli
    install -Dm755 target/release/gui "${pkgdir}"/usr/bin/lact-gui
}
