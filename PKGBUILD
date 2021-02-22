# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=fastfetch-git
pkgver=r15.f14e846
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in c. Downside: only Linux"
arch=("any")
url="https://github.com/LinusDierheimer/fastfetch#README"
license=("MIT")
depends=("pciutils" "libx11")
makedepends=("cmake")
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
}
