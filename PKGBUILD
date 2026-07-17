pkgname='dim-caelestia-shell-git'
pkgver=2.2.0
pkgrel=1
pkgdesc="DiM's fork of Caelestia-Shell"
arch=('x86_64' 'aarch64')
url='https://github.com/dim-ghub/caelestia-shell'
license=('GPL-3.0-only')
depends=('dim-caelestia-cli-git' 'quickshell-git' 'ddcutil' 'brightnessctl' 'libcava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative' 'qt6-imageformats')
makedepends=('cmake' 'ninja' 'qt6-shadertools')
provides=('caelestia-shell')
conflicts=('caelestia-shell')
source=("${pkgname}::git+https://github.com/dim-ghub/caelestia-shell.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DVERSION=$pkgver \
        -DGIT_REVISION="$(git rev-parse --short HEAD)" \
        -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}