# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=steam-buddy
pkgver=0.10.1
pkgrel=1
pkgdesc="A web interface for managing Steam remotely"
arch=('any')
url="https://github.com/gamer-os/steam-buddy"
license=('MIT')
depends=('python' 'python-bottle' 'python-pyftpdlib' 'python-yaml' 'python-requests' 'python-beaker' 'python-pygame' 'python-bcrypt' 'python-psutil' 'python-pillow' 'steam-tweaks' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x' 'libretro-mupen64plus-next' 'libretro-beetle-pce-fast' 'libretro-flycast' 'libretro-beetle-psx-hw' 'libretro-play' 'libretro-yabause' 'libretro-dolphin' 'retroarch-autoconfig-udev-git' 'flatpak' 'xdotool' 'ponymix' 'libretro-picodrive' 'legendary' 'ttf-dejavu' 'wyvern' 'innoextract')
optdepends=('libretro-mame-git' 'libretro-stella2014-git' 'libretro-opera-git') # compiling cores takes a long time, so make them optional
source=("https://github.com/gamer-os/steam-buddy/archive/$pkgver.tar.gz")
md5sums=('987ddd80ccddde78a953b200b83883f7')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
        mkdir -p "$pkgdir/etc/systemd/system"
        mkdir -p "$pkgdir/usr/lib/systemd/user"
        install -m 644 "steam-buddy.service" "$pkgdir/usr/lib/systemd/user/steam-buddy.service"
        install -m 644 "steam-buddy-proxy.service" "$pkgdir/etc/systemd/system/steam-buddy-proxy.service"
        install -m 644 "steam-buddy-proxy.socket" "$pkgdir/etc/systemd/system/steam-buddy-proxy.socket"
}
