# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgbase=lib-starfish
pkgname=lib-starfish
pkgver=0.0.4
pkgrel=1
pkgdesc="Starfish graph visualization shared library"
arch=('x86_64')
url="https://github.com/Seafoam-Labs/Starfish"
license=('GPL-3.0-only')
provides=('lib-starfish')
depends=(
    'gtk4'
    'glib2'
    'libglvnd'
    'glibc'
)
makedepends=('dotnet-sdk-10.0' 'clang')

# Source tarball from GitHub release
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/Starfish/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/Starfish-${pkgver}"

  # Build the shared library (.so)
  dotnet publish Starfish.GraphWidget/Starfish.GraphWidget.csproj -c Release -r linux-x64 -o out-widget --nologo -p:InstructionSet=${INSTRUCTIONS:=x86-64}
}

package() {
  cd "$srcdir/Starfish-${pkgver}"

  # Install the shared library
  install -Dm755 out-widget/Starfish.GraphWidget.so "$pkgdir/usr/lib/lib-starfish.so"
}
sha256sums=('35694517c72883e2427aad44ddffb237431f87a3a7de899d1e1bd5ff5eac44d1')
sha256sums=('35694517c72883e2427aad44ddffb237431f87a3a7de899d1e1bd5ff5eac44d1')
