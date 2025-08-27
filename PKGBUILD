# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

_pkgname='caelestia-shell'
pkgname="$_pkgname-git"
pkgver=r1135.9030634
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64')
url='https://github.com/caelestia-dots/shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell-git' 'ddcutil' 'brightnessctl' 'app2unit' 'cava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'grim' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative')
makedepends=('git' 'cmake' 'ninja')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
