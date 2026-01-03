# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell'
pkgver=1.4.0
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
sha256sums=('827ee99de109164266a9558c0db4dee2fd162ab2b2f35d789423e746246d0a13')

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
