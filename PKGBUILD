# Maintainer: Mohammad Qaddoumi <mqaddumi.7994kohaa@gmail.com>
pkgname=quickshell-allflags-git
pkgver=r715.41828c4  # This will be auto-updated
pkgrel=1
pkgdesc="QtQuick based desktop shell toolkit - All features enabled (git version)"
arch=('x86_64')
url="https://quickshell.outfoxxed.me/"
license=('LGPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-wayland'
    'wayland'
    'libpipewire'
    'pam'
    'polkit'
    'glib2'
    'libxcb'
    'jemalloc'
    'libdrm'
    'mesa'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'pkg-config'
    'qt6-shadertools'
    'spirv-tools'
    'wayland-protocols'
    'cli11'
)
provides=('quickshell')
conflicts=('quickshell' 'quickshell-git')
source=("git+https://github.com/quickshell-mirror/quickshell.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/quickshell"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/quickshell"
    
    cmake -B build -S . \
        -GNinja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDISTRIBUTOR="AUR (quickshell-allflags-git)" \
        -DDISTRIBUTOR_DEBUGINFO_AVAILABLE=NO \
        -DCRASH_REPORTER=OFF
    
    cmake --build build
}

package() {
    cd "$srcdir/quickshell"
    DESTDIR="$pkgdir" cmake --install build
}
