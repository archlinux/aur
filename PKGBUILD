# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=chimera
pkgver=0.17.5
pkgrel=1
pkgdesc="Configure and manage games in Steam"
arch=('any')
url="https://github.com/chimeraos/chimera"
license=('MIT')
provides=('steam-tweaks' 'steam-buddy')
conflicts=('steam-tweaks' 'steam-buddy')
depends=('python' 'python-bottle' 'python-pyftpdlib' 'python-yaml' 'python-vdf' 'python-inotify-simple' 'python-requests' 'python-beaker' 'python-pyglet' 'python-bcrypt' 'python-psutil' 'python-pyudev' 'python-leveldb' 'python-paste' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x' 'libretro-mupen64plus-next' 'libretro-beetle-pce-fast' 'libretro-flycast' 'libretro-beetle-psx-hw' 'libretro-pcsx2' 'libretro-kronos' 'libretro-mame' 'libretro-dolphin' 'libretro-desmume' 'libretro-picodrive' 'libretro-mesen-s' 'dolphin-emu' 'retroarch-autoconfig-udev-git' 'flatpak' 'xdotool' 'xorg-xprop' 'xorg-xwininfo' 'xorg-xdpyinfo' 'ponymix' 'legendary' 'ttf-dejavu' 'innoextract' 'mesa-utils' 'yq')
optdepends=('libretro-stella2014-git' 'libretro-opera-git' 'libretro-prosystem-git' 'libretro-citra' 'srt-live-server' 'steam-removable-media-git' 'ffmpeg' 'wyvern') # compiling cores takes a long time, so make them optional
source=("$pkgname-$pkgver.tar.gz::https://github.com/chimeraos/$pkgname/archive/$pkgver.tar.gz")
md5sums=('001aef1df9f136e1a5c0738e4509d225')

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
