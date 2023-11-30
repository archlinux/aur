# Maintainer: Angelo Geulin <angelogeulin123 at gmail dot com>

pkgname=apidash-bin
pkgver=0.3.0
pkgrel=3
pkgdesc="Beautiful open-source cross-platform API Client"
arch=('x86_64')
url="https://apidash.dev"
license=('Apache-2.0')
depends=()
options=('!emptydirs' '!strip')
source=("https://github.com/foss42/apidash/releases/download/v${pkgver}/apidash-linux-amd64.deb"
        'LICENSE')
sha512sums=('6ee413c6bac3384c4a43afc6c70be52620d1969cc617f83d70bb190fd61c60f32d92aeb2a862f3b956fa3b96b4b004186ef29f08c5919ea68257c11821ce581f'
            '9f2413ded2307a4f9ecef62d7876274f1aa284e88a9431ed15be4a080549e68e796cb8e9919d58aa3b4247f7aeca6e62ca4e550ab983bd7d5c9324eecfd5dbd0')

package() {
    bsdtar -xf data.tar.zst -C "$pkgdir/"

    # Fix permissions of directories.
    find "$pkgdir/" -type d -exec chmod 755 {} \;

    # Create a symlink inside the /usr/bin directory.
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/share/apidash/apidash "$pkgdir/usr/bin/apidash"

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/apidash/LICENSE
}
