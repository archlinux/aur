# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell'
pkgver=1.3.4
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64')
url='https://github.com/caelestia-dots/shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell-git' 'ddcutil' 'brightnessctl' 'app2unit' 'libcava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja')
provides=($pkgname)
conflicts=($pkgname-git)
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('7d2c7e360cb1e17ea141e577b3639be32e14c7fadfc54686569047da8d34735f')

build() {
    cd "${srcdir}/release"

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/ -DVERSION=$pkgver -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/release"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
