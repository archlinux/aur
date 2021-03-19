# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=fastfetch-git
pkgver=r65.1ceb5c9
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in c. Downside: only Linux"
arch=("any")
url="https://github.com/LinusDierheimer/fastfetch"
license=("MIT")
depends=()
makedepends=(
  "cmake"
  "libxrandr" # Depends on libX11, which is also needed
)
optdepends=(
  "pciutils: GPU output"
  "libx11: Resolution output"
  "libxrandr: Refresh rate in Resolution output"
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
