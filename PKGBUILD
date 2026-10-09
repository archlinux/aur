# Maintainer: kengzzzz

pkgname=broadcast-linux-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="NVIDIA Broadcast effects as a virtual mic and camera under Wine"
arch=(x86_64)
url="https://github.com/kengzzzz/broadcast-linux"
license=(MIT LGPL-2.1-or-later BSD-3-Clause IJG OFL-1.1 Ubuntu-font-1.0 Bitstream-Vera)
depends=('glibc>=2.35' libgcc libpipewire pipewire wireplumber 'wine>=10' nvidia-utils libglvnd libxkbcommon wayland)
optdepends=('pipewire-pulse: lets apps that use PulseAudio (most of them) see the devices'
            'v4l2loopback-dkms: virtual camera, unless your kernel already provides the module'
            'xdg-desktop-portal: picking a background image in the settings window'
            'libx11: the settings window on X11'
            'libxcursor: the settings window on X11'
            'libxi: the settings window on X11'
            'libxrender: the settings window on X11'
            'libxkbcommon-x11: the settings window on X11')
provides=("broadcast-linux=$pkgver")
conflicts=(broadcast-linux)
options=(!strip !debug)
install=broadcast-linux.install
source=("$url/releases/download/v$pkgver/broadcast-linux-$pkgver-$CARCH.tar.gz")
# Run updpkgsums after the GitHub release is published, before pushing to AUR.
sha256sums=('66073fc35759f37470d65bf7a15de997e58142017a12878144fa04180ad7db44')

package() {
    cd "broadcast-linux-$pkgver-$CARCH"
    install -Dm755 -t "$pkgdir/usr/bin" bin/broadcast-linux bin/broadcast-linux-gui
    install -d "$pkgdir/usr/lib"
    cp -a lib/broadcast-linux "$pkgdir/usr/lib/"
    install -Dm644 share/broadcast-linux.service "$pkgdir/usr/lib/systemd/user/broadcast-linux.service"
    install -Dm644 share/modules-load.conf "$pkgdir/usr/lib/modules-load.d/broadcast-linux.conf"
    install -Dm644 share/modprobe.conf "$pkgdir/usr/lib/modprobe.d/broadcast-linux.conf"
    install -Dm644 share/config.toml "$pkgdir/usr/share/doc/broadcast-linux/config.toml"
    install -Dm644 share/broadcast-linux.desktop "$pkgdir/usr/share/applications/broadcast-linux.desktop"
    install -Dm644 share/broadcast-linux.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/broadcast-linux.svg"
    install -Dm644 README.md CHANGELOG.md BUILD-INFO -t "$pkgdir/usr/share/doc/broadcast-linux/"
    install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/broadcast-linux/docs/"
    install -Dm644 LICENSE LICENSE.nvcuda.md LICENSE.nvidia-vfx-headers LICENSE.libjpeg-turbo LICENSE.fonts -t "$pkgdir/usr/share/licenses/$pkgname/"
}
