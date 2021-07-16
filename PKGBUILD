pkgname=tribler
_pkgname=tribler
pkgver=7.10.0
pkgrel=2
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
python-decorator
python-faker
python-libnacl
python-lz4
python-marshmallow
python-netifaces
python-networkx
python-pillow
python-pony
python-psutil
python-pyasn1
python-pyopenssl
python-pyqt5
python-pyqtgraph
python-service-identity
python-twisted
python-yaml
python-sentry_sdk
python-yappi)
source=(
https://github.com/Tribler/tribler/releases/download/v$pkgver/Tribler-v$pkgver.tar.xz
https://github.com/G-P-L/AUR/raw/master/Tribler/Tribler.desktop
https://github.com/G-P-L/AUR/raw/master/Tribler/tribler.sh)

sha256sums=('09564e54e592d1fbdf835c838961516b8bf84e9ce5f11315050eb3d086f885f4'
            '6b7ae61a0679a468860e5cc735f30185883088b1668c4193fcc05382cdd5173f'
            'b357229d5decc3ff3d0e5ec25907258b2372a5ee93462950e4283c664cdcc776')

package() {
    install -d "$pkgdir/opt/Tribler/"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"

    # Copy files from the source tarball to /opt/Tribler/.
    cp -r "$srcdir/tribler/src/"{pyipv8,tribler-common,tribler-core,tribler-gui,requirements.txt,run_tribler.py} "$pkgdir/opt/Tribler/"
    cp -r "$srcdir/tribler/build/debian/tribler/usr/share/pixmaps/tribler_big.xpm" "$pkgdir/opt/Tribler/"
    install -Dm644 tribler.sh "$pkgdir/opt/Tribler/tribler.sh"
    chmod +x "$pkgdir/opt/Tribler/tribler.sh"
        
    # Copy desktop launcher to /usr/share/applications/.
    install -Dm644 Tribler.desktop "$pkgdir/usr/share/applications/Tribler.desktop"

    # Create binary symlink to /usr/bin/.
    ln -s /opt/Tribler/tribler.sh $pkgdir/usr/bin/tribler
}
