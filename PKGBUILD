# Maintainer: AnoGP <anogp at pm dot me>

pkgname=tribler
_pkgname=tribler
pkgver=7.5.4
pkgrel=1
pkgdesc="P2P/Bittorrent/YouTube client"
arch=("x86_64")
url="http://tribler.org"
license=("GPL3")
provides=("tribler")
conflicts=("tribler")
depends=(libtorrent-rasterbar
python-aiohttp
python-aiohttp-apispec
python-bitcoinlib
python-chardet
python-cherrypy
python-configobj
python-cryptography
python-libnacl
python-lz4
python-netifaces
python-networkx
python-pony
python-psutil
python-pyasn1
python-pyopenssl
python-pyqt5
python-pyqtgraph
python-twisted
vlc)
source=(
https://github.com/Tribler/tribler/releases/download/v$pkgver/Tribler-v$pkgver.tar.xz
https://github.com/G-P-L/AUR/raw/master/Tribler/Tribler.desktop
https://github.com/G-P-L/AUR/raw/master/Tribler/tribler.sh)

sha256sums=('9b9e4707c02426241297a878e6d87b808b1b72197c6f49edccf8d22ca3c81c73'
            '6b7ae61a0679a468860e5cc735f30185883088b1668c4193fcc05382cdd5173f'
            'b357229d5decc3ff3d0e5ec25907258b2372a5ee93462950e4283c664cdcc776')

package() {
    install -d "$pkgdir/opt/Tribler"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"

    # Copy files from the source tarball to /opt/Tribler/.
    cp -r "$srcdir/tribler/src/"{anydex,pyipv8,tribler-common,tribler-core,tribler-gui,requirements.txt,run_tribler.py} "$pkgdir/opt/Tribler/"
    cp -r "$srcdir/tribler/build/debian/tribler/usr/share/pixmaps/tribler_big.xpm" "$pkgdir/opt/Tribler/"
    install -Dm644 tribler.sh "$pkgdir/opt/Tribler/"
    chmod +x "$pkgdir/opt/Tribler/tribler.sh"
        
    # Copy desktop launcher to /usr/share/applications/.
    install -Dm644 Tribler.desktop "$pkgdir/usr/share/applications/Tribler.desktop"

    # Create binary symlink to /usr/bin/.
    ln -s /opt/Tribler/tribler.sh $pkgdir/usr/bin/tribler
}
