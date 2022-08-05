# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=chimera
pkgver=0.14.11
pkgrel=2
pkgdesc="Configure and manage games in Steam"
arch=('any')
url="https://github.com/chimeraos/chimera"
license=('MIT')
provides=('steam-tweaks' 'steam-buddy')
conflicts=('steam-tweaks' 'steam-buddy')
depends=('python' 'python-bottle' 'python-pyftpdlib' 'python-yaml' 'python-vdf' 'python-inotify-simple' 'python-requests' 'python-beaker' 'python-pygame' 'python-bcrypt' 'python-psutil' 'python-pyudev' 'python-leveldb' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x' 'libretro-mupen64plus-next' 'libretro-beetle-pce-fast' 'libretro-flycast' 'libretro-beetle-psx-hw' 'libretro-play' 'libretro-kronos' 'libretro-dolphin' 'retroarch-autoconfig-udev-git' 'flatpak' 'xdotool' 'xorg-xprop' 'xorg-xwininfo' 'xorg-xdpyinfo' 'ponymix' 'libretro-picodrive' 'legendary' 'ttf-dejavu' 'wyvern' 'innoextract' 'mesa-utils')
optdepends=('libretro-mame' 'libretro-stella2014-git' 'libretro-opera-git' 'srt-live-server' 'steam-removable-media-git') # compiling cores takes a long time, so make them optional
source=("$pkgname-$pkgver.tar.gz::https://github.com/chimeraos/$pkgname/archive/$pkgver.tar.gz")
md5sums=('08ff3e4cba3bf8c2a1f7755a9f6ff4cf')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
        mkdir -p "$pkgdir/etc/systemd/system"
        mkdir -p "$pkgdir/usr/lib/systemd/user"
        install -m 644 "chimera.service" "$pkgdir/usr/lib/systemd/user/chimera.service"
        install -m 644 "steam-patch.service" "$pkgdir/usr/lib/systemd/user/steam-patch.service"
        install -m 644 "chimera-proxy.service" "$pkgdir/etc/systemd/system/chimera-proxy.service"
        install -m 644 "chimera-proxy.socket" "$pkgdir/etc/systemd/system/chimera-proxy.socket"
}
