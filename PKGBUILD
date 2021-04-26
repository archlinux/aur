# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=leagueoflegends-git
pkgver=0.11.8.r0.g428d14f
pkgrel=1
pkgdesc="League of Legends helper script"
arch=('any')
url="https://github.com/kyechou/leagueoflegends"
license=('GPL3')
depends=('wine-lol' 'winetricks' 'bash' 'curl' 'openssl' 'lib32-gnutls'
         'lib32-libldap' 'lib32-openal' 'lib32-libpulse' 'vulkan-icd-loader'
         'lib32-vulkan-icd-loader' 'vulkan-driver' 'lib32-vulkan-driver')
makedepends=()
optdepends=("lib32-amdvlk: AMD Vulkan driver"
            "lib32-nvidia-utils: NVIDIA Vulkan driver"
            "lib32-vulkan-intel: Intel's Vulkan mesa driver"
            "lib32-vulkan-radeon: Radeon's Vulkan mesa driver"
            "zenity: Loading screen indication")
provides=('leagueoflegends')
conflicts=('leagueoflegends')
source=("$pkgname"::'git+https://github.com/kyechou/leagueoflegends')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
