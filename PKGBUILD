# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-bin
pkgver=0.8.0
pkgrel=4
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url="https://veloren.net/"
license=('GPL3')
options=('!strip')
depends=('systemd-libs' 'alsa-lib' 'libxcb')
makedepends=()
provides=("$pkgname" 'veloren')
conflicts=("$pkgname" 'veloren')
source=(
    "$pkgname"::"https://veloren-4129.fra1.digitaloceanspaces.com/releases/$pkgver-linux.tar.gz"
    'voxygen-wrapper.sh'
    'server-cli-wrapper.sh'
)
noextract=('voxygen-wrapper.sh' 'server-cli-wrapper.sh')
sha512sums=('734fff7deec2e6981d9adab3ce86c30ead9d06340a7b5bb680a6c5d1929fd159b0f1fa0c4889cb48dcd09d869cabe6a347e13be3395da3b07bf4233385e4603e'
            'e35c852bfa8d80a78a4df50c09246e69431efe9ebc208bd3c2a864e7674ee1078ab0d2eb2b2ffc1b67847ab7125a38dd260d8964054f55cdf0305248ece9a11c'
            '0de4091b3fc6a60d07da2fd590a04e6a3770329455e1e50c5f78259280dab2eddde6721800b741e859490fcff1ff153d99140f5ebb49f78e8e23764b9fa20797')

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
