# Maintainer: kengzzzz

pkgname=broadcast-linux-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="NVIDIA Broadcast effects as a virtual mic and camera under Wine"
arch=(x86_64)
url="https://github.com/kengzzzz/broadcast-linux"
license=(MIT LGPL-2.1-or-later)
depends=('glibc>=2.39' libgcc libpipewire pipewire wireplumber libpulse 'wine>=11' ffmpeg nvidia-utils)
optdepends=('v4l2loopback-dkms: virtual camera, unless your kernel already provides the module')
provides=("broadcast-linux=$pkgver")
conflicts=(broadcast-linux)
options=(!strip !debug)
install=broadcast-linux.install
source=("$url/releases/download/v$pkgver/broadcast-linux-$pkgver-$CARCH.tar.gz")
# Run updpkgsums after the GitHub release is published, before pushing to AUR.
sha256sums=('13abe709936253aa3843a5d41dc5709661661f1cfb9c3ad4e71060f9d19f191c')

package() {
    cd "broadcast-linux-$pkgver-$CARCH"
    install -Dm755 bin/broadcast-linux "$pkgdir/usr/bin/broadcast-linux"
    install -d "$pkgdir/usr/lib"
    cp -a lib/broadcast-linux "$pkgdir/usr/lib/"
    install -Dm644 share/broadcast-linux.service "$pkgdir/usr/lib/systemd/user/broadcast-linux.service"
    install -Dm644 share/modules-load.conf "$pkgdir/usr/lib/modules-load.d/broadcast-linux.conf"
    install -Dm644 share/modprobe.conf "$pkgdir/usr/lib/modprobe.d/broadcast-linux.conf"
    install -Dm644 share/config.toml "$pkgdir/usr/share/doc/broadcast-linux/config.toml"
    install -Dm644 README.md BUILD-INFO -t "$pkgdir/usr/share/doc/broadcast-linux/"
    install -Dm644 LICENSE LICENSE.nvcuda.md LICENSE.nvidia-vfx-headers -t "$pkgdir/usr/share/licenses/$pkgname/"
}
