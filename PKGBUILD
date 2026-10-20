# Maintainer: Anas Khalifa <anasgets111@gmail.com>

# release.yml's aur job sets pkgver and sha256sums from each tag and pushes this to the AUR.
pkgname=mantle-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Wayland shell engine: bars, panels and lock screens written in Lua (release binaries)'
arch=('x86_64')
url='https://github.com/anasgets111/mantle'
license=('MIT')
depends=('fontconfig' 'libgcc' 'glibc' 'libglvnd' 'libpipewire' 'libxkbcommon' 'mesa'
         'pacman' 'pam' 'polkit' 'systemd-libs' 'wayland')
optdepends=('niri: workspaces, windows and keyboard layout'
            'hyprland: workspaces, windows and keyboard layout'
            'sway: workspaces, windows and keyboard layout'
            'mangowm: workspaces, windows and keyboard layout'
            'paru: AUR package updates'
            'yay: AUR package updates'
            'sound-theme-freedesktop: notification sounds'
            'lua-language-server: type-checking the config in an editor')
provides=("mantle=$pkgver")
conflicts=('mantle' 'mantle-git')
backup=('etc/pam.d/mantle')
# The release build already strips its binaries.
options=('!debug' '!strip')
source=("$url/releases/download/v$pkgver/mantle-$pkgver-$CARCH-linux.tar.gz")
sha256sums=('03829e6d3990d01020c5cd8ceb2271cdd655da5dc97f7bba03348947e06814df')

# The tarball installs under /usr/local; its relative symlink and stub lookup work under /usr too.
package() {
    install -dm755 "$pkgdir/usr"
    cp -a usr/local/. "$pkgdir/usr/"
    mv "$pkgdir/usr/share/licenses/mantle" "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 etc/pam.d/mantle "$pkgdir/etc/pam.d/mantle"
    install -Dm644 -t "$pkgdir/usr/share/polkit-1/rules.d" etc/polkit-1/rules.d/*.rules
}
