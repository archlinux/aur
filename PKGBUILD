# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="The last stable release of an open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url="https://veloren.net/"
license=('GPL3')
options=('!strip')
depends=('alsa-lib' 'glslang' 'libxkbcommon-x11' 'pulseaudio-alsa' 'vulkan-icd-loader')
makedepends=()
provides=('veloren')
conflicts=('veloren')
source=(
    "$pkgname-$pkgver"::"https://gitlab.com/veloren/veloren/-/jobs/2761241182/artifacts/download"
    'voxygen-wrapper.sh'
    'server-cli-wrapper.sh'
)
noextract=('voxygen-wrapper.sh' 'server-cli-wrapper.sh')
sha512sums=('291aaa36355cc54b3ba0e8f748d8686fda9ddfb6e3582611a3bdd60d1d472d7a6ad77dd14fc88c571dd2e56f286af3cdb8fa8a955655be4952c3e27b74dc9a35'
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
