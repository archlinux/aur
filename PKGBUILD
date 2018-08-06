# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=creepminer
_realname=creepMiner
pkgver=1.8.3
pkgrel=1
pkgdesc="Burstcoin C++ CPU and GPU Miner"
arch=('i686' 'x86_64')
url="https://github.com/Creepsky/creepMiner"
license=('GPL3')
options=('strip' '!emptydirs')
depends=('xdg-utils' 'openssl-1.0')
install=creepminer.install
source=(https://github.com/Creepsky/creepMiner/releases/download/$pkgver/$_realname-$pkgver.0-Linux.tar.gz
creepminer.service
)
sha256sums=('10aef439d282f301a6210a24833ab3f7831f5aba73bb66e11c53eaaf538a46d2'
            '88c88b2bbe1f065c5b905ad9158579ccd8b98aa9b5b6950aaac6f2c4759256ae')

package() {
    cd "$srcdir/$_realname-$pkgver.0-Linux/opt/$_realname-$pkgver.0"

    # Lib directory
    install -d "$pkgdir/opt/$pkgname"
    cp -a lib public mining.cl "$pkgdir/opt/$pkgname"
    install -Dm755 $_realname "$pkgdir/opt/$pkgname/$pkgname"

    # Daemon
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
