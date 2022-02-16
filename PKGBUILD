# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgbase=leagueoflegends-git
pkgname=(leagueoflegends-git leagueoflegends-ge-git)
_srcname=leagueoflegends
pkgver=0.12.3.r1.g040b76b
pkgrel=1
pkgdesc="League of Legends helper script"
arch=('any')
url="https://github.com/kyechou/leagueoflegends"
license=('GPL3')
depends=('winetricks-git' 'bash' 'curl' 'openssl' 'samba' 'lib32-gnutls'
         'lib32-libldap' 'lib32-openal' 'lib32-libpulse' 'lib32-alsa-lib'
         'lib32-mpg123' 'lib32-unixodbc' 'lib32-vkd3d' 'vulkan-icd-loader'
         'lib32-vulkan-icd-loader' 'vulkan-driver' 'lib32-vulkan-driver')
makedepends=()
optdepends=("lib32-amdvlk: AMD Vulkan driver"
            "lib32-nvidia-utils: NVIDIA Vulkan driver"
            "lib32-vulkan-intel: Intel's Vulkan mesa driver"
            "lib32-vulkan-radeon: Radeon's Vulkan mesa driver"
            "zenity: Loading screen indication")
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

package_leagueoflegends-git() {
    depends+=('wine-lol')
    conflicts+=('leagueoflegends-ge-git')

    cd "$srcdir/$_srcname"
    make DESTDIR="$pkgdir" install
}

package_leagueoflegends-ge-git() {
    depends+=('wine-ge-lol')
    conflicts+=('leagueoflegends-git')

    cd "$srcdir/$_srcname"
    make DESTDIR="$pkgdir" install-ge
}
