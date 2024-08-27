# Maintainer: LunarEclipse <luna@lunareclipse.zone>

pkgname=veloren-bin
pkgver=0.16.0
pkgrel=2
pkgdesc="The last stable release of an open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url="https://veloren.net/"
license=('GPL3')
options=('!strip')
depends=('alsa-lib' 'glslang' 'libxkbcommon-x11' 'vulkan-icd-loader')
optdepends=(
    'pulseaudio-alsa: audio support on pulseaudio'
    'pipewire-alsa: audio support on pipewire'
)
makedepends=()
provides=('veloren')
conflicts=('veloren')
source=(
    "$pkgname-$pkgver"::"https://gitlab.com/veloren/veloren/-/jobs/artifacts/v${pkgver}/download?job=linux-x86_64"
    'voxygen-wrapper.sh'
    'server-cli-wrapper.sh'
)
noextract=('voxygen-wrapper.sh' 'server-cli-wrapper.sh')
sha512sums=('8a3648721ac969bfedd371546c8ecba7527cb2ece434273045f29abd55fd236da094611db97637a2094d6a3f83f18322ecd460bd9b7916a3446238211b0ffa63'
            'e35c852bfa8d80a78a4df50c09246e69431efe9ebc208bd3c2a864e7674ee1078ab0d2eb2b2ffc1b67847ab7125a38dd260d8964054f55cdf0305248ece9a11c'
            'a1ec4d3590af0f07be59c22de3de9402e7ed20eff7fb2b086773f04e8019a607a843a9ba0cf59df48431a5d9a3eb1d0c79272dced9a812c11ae7ed52e41bb0d2')

package() {
    install -D "$srcdir/veloren-voxygen" -T "$pkgdir/usr/lib/veloren/voxygen"
    install -D "$srcdir/voxygen-wrapper.sh" -T "$pkgdir/usr/bin/veloren-voxygen"
    install -D "$srcdir/veloren-server-cli" -T "$pkgdir/usr/lib/veloren/server-cli"
    install -D "$srcdir/server-cli-wrapper.sh" -T "$pkgdir/usr/bin/veloren-server-cli"
    mkdir -p "$pkgdir/usr/share/veloren"
    cp -a "$srcdir/assets" "$pkgdir/usr/share/veloren/"
    install -Dm 644 "$srcdir/assets/voxygen/net.veloren.veloren.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm 644 "$srcdir/assets/voxygen/net.veloren.veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm 644 "$srcdir/assets/voxygen/net.veloren.veloren.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
}
