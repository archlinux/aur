# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=steam-buddy
pkgver=0.11.0
pkgrel=1
pkgdesc="Configure and manage games in Steam"
arch=('any')
url="https://github.com/gamer-os/steam-buddy"
license=('MIT')
provides=('steam-tweaks')
conflicts=('steam-tweaks')
depends=('python' 'python-bottle' 'python-pyftpdlib' 'python-yaml' 'python-vdf' 'python-inotify-simple' 'python-requests' 'python-beaker' 'python-pygame' 'python-bcrypt' 'python-psutil' 'python-pillow' 'steam-tweaks' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x' 'libretro-mupen64plus-next' 'libretro-beetle-pce-fast' 'libretro-flycast' 'libretro-beetle-psx-hw' 'libretro-play' 'libretro-yabause' 'libretro-dolphin' 'retroarch-autoconfig-udev-git' 'flatpak' 'xdotool' 'ponymix' 'libretro-picodrive' 'legendary' 'ttf-dejavu' 'wyvern' 'innoextract')
optdepends=('libretro-mame-git' 'libretro-stella2014-git' 'libretro-opera-git' 'srt-live-server') # compiling cores takes a long time, so make them optional
source=("https://github.com/gamer-os/steam-buddy/archive/$pkgver.tar.gz")
md5sums=('79c1b9a173e714c877a873b5837ebf01')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
        mkdir -p "$pkgdir/usr/share/steam-tweaks"
        mkdir -p "$pkgdir/etc/systemd/system"
        mkdir -p "$pkgdir/usr/lib/systemd/user"
        cp -r "data" "$pkgdir/usr/share/steam-tweaks"
        cp -r "compat-tools" "$pkgdir/usr/share/steam-tweaks"
        install -m 644 "steam-buddy.service" "$pkgdir/usr/lib/systemd/user/steam-buddy.service"
        install -m 644 "steam-patch.service" "$pkgdir/usr/lib/systemd/user/steam-patch.service"
        install -m 644 "steam-buddy-proxy.service" "$pkgdir/etc/systemd/system/steam-buddy-proxy.service"
        install -m 644 "steam-buddy-proxy.socket" "$pkgdir/etc/systemd/system/steam-buddy-proxy.socket"
}
