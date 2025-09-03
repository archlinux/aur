# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell'
pkgver=1.1.1
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64')
url='https://github.com/caelestia-dots/shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell-git' 'ddcutil' 'brightnessctl' 'app2unit' 'cava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja')
provides=($pkgname)
conflicts=($pkgname)
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('67e698567cc8774ed1e5a9d53dc9ab2a8627c634fd887bbb9fb391646e4da6ae')

build() {
    cd "${srcdir}/release"

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/ -DVERSION=$pkgver -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/release"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
