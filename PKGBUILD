# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=leagueoflegends-git
pkgver=0.11.22.r11.gb5ded8c
pkgrel=1
pkgdesc="League of Legends helper script"
arch=('any')
url="https://github.com/kyechou/leagueoflegends"
license=('GPL3')
depends=('wine-lol>=5.18' 'winetricks-git' 'bash' 'curl' 'openssl' 'samba'
         'lib32-gnutls' 'lib32-libldap' 'lib32-openal' 'lib32-libpulse'
         'lib32-alsa-lib' 'lib32-unixodbc' 'lib32-vkd3d' 'vulkan-icd-loader'
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
