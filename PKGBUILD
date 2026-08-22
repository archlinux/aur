pkgname=dotnet-manager
pkgver=1.1.0
pkgrel=1
pkgdesc="A Qt GUI for installing and switching between .NET SDKs, runtimes and workloads"
arch=('x86_64' 'aarch64')
url="https://github.com/wheat32/dotnet-manager"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-svg'
    'polkit'
)
optdepends=(
    'curl: download .NET releases (wget works too)'
    'wget: download .NET releases (curl works too)'
    'qt6-wayland: native Wayland support'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
    'qt6-tools'
)
source=(
  "git+https://github.com/wheat32/dotnet-manager.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
    cmake -S "${srcdir}/${pkgname}/src" \
          -B build \
          -G Ninja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
