# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=fastfetch-git
pkgver=r142.3e9ce54
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in c. Only Linux."
arch=("any")
url="https://github.com/LinusDierheimer/fastfetch"
license=("MIT")
depends=()
makedepends=(
  "cmake"
  "pciutils"
  "libxrandr" # Depends on libX11, which headers are also needed
  "dconf"     # Depends on glib2, which headers are also needed
  "wayland"
)
optdepends=(
  "pciutils: GPU output"
  "libx11: Resolution output"
  "libxrandr: Refresh rate in Resolution output"
  "dconf: GTK ouput on DEs which dont use config files (like Gnome)"
  "wayland: Better resolution performance + support for monitors with different refresh rates in wayland sessions"
)
provides=("flashfetch=${pkgver}")
source=("git+https://github.com/LinusDierheimer/fastfetch.git")
sha256sums=("SKIP")

pkgver() {
  cd "fastfetch/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "${srcdir}/fastfetch"
    mkdir -p build/
    cd build/
    cmake ..
    cmake --build .
}

package() {
    cd ${srcdir}/fastfetch
    install -D "build/fastfetch" "${pkgdir}/usr/bin/fastfetch"
    install -D "build/flashfetch" "${pkgdir}/usr/bin/flashfetch"
    install -D "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/fastfetch"
}
