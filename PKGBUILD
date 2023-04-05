# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=(leagueoflegends-git)
_srcname=${pkgname%-git}
pkgver=13.7.r1.g6590b39
pkgrel=1
pkgdesc="League of Legends helper script"
arch=('any')
url="https://github.com/kyechou/leagueoflegends"
license=('GPL3')
depends=('wine-lol' 'winetricks' 'bash' 'curl' 'openssl' 'samba' 'mesa-utils'
         'gnutls' 'lib32-gnutls' 'libldap' 'lib32-libldap' 'openal'
         'lib32-openal' 'libpulse' 'lib32-libpulse' 'alsa-lib' 'lib32-alsa-lib'
         'mpg123' 'lib32-mpg123' 'unixodbc' 'lib32-unixodbc' 'vkd3d'
         'lib32-vkd3d' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader'
         'vulkan-driver' 'lib32-vulkan-driver')
makedepends=()
optdepends=("amdvlk: AMD Vulkan driver"
            "nvidia-utils: NVIDIA Vulkan driver"
            "vulkan-intel: Intel's Vulkan mesa driver"
            "vulkan-radeon: Radeon's Vulkan mesa driver"
            "lib32-amdvlk: AMD Vulkan driver (32-bit)"
            "lib32-nvidia-utils: NVIDIA Vulkan driver (32-bit)"
            "lib32-vulkan-intel: Intel's Vulkan mesa driver (32-bit)"
            "lib32-vulkan-radeon: Radeon's Vulkan mesa driver (32-bit)")
provides=('leagueoflegends')
conflicts=('leagueoflegends')
source=("$_srcname"::'git+https://github.com/kyechou/leagueoflegends')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_srcname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

package() {
    cd "$srcdir/$_srcname"
    make DESTDIR="$pkgdir" install
}
