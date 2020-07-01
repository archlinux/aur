pkgname=dobiestation
pkgrel=1
pkgver=r1760.ff3a064
pkgdesc='A Dog based emulator for the ps2'
arch=(x86_64)
url=https://github.com/PSI-Rockin/DobieStation/
license=('GPL')
groups=()
depends=(qt5-base)
makedepends=(
gcc
cmake
git
)
provides=(dobiestation)
conflicts=(dobiestation)
replaces=(dobiestation)

pkgver()
{
  cd "DobieStation"
  (   
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


prepare()
{
    git clone https://github.com/PSI-Rockin/DobieStation.git
    cd DobieStation
    mkdir build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd DobieStation && cd build
    make 
}

package() {
    cd DobieStation && cd build
    make DESTDIR="$pkgdir" install
}