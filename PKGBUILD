# Maintainer: redfish <redfish at galactica dot pw>

pkgname='zeronet'
pkgver=0.7.1
pkgrel=1
arch=('any')
url="https://zeronet.io/"
depends=('python' 'python-gevent>=1.1.0' 'python-gevent-websocket'
	'python-msgpack>=0.4.4' 'python-websocket-client' 'python-rsa'
	'python-pysocks' 'python-pyasn1' 'python-pyasn1-modules'
	'python-base58' 'python-merkletools'
	'python-pyelliptic>=2.0.1'
	'python-bencode.py' 'python-coincurve'
	'python-bitcoinlib' 'python-maxminddb'
	'geoip2-database')
optdepends=('tor: anonymity'
	    'namecoin-core: local name resolution')
checkdepends=('python-pytest' 'python-mock')
license=('GPL2')
pkgdesc="Decentralized websites using Bitcoin crypto and the BitTorrent network."
source=("https://github.com/HelloZeroNet/ZeroNet/archive/v$pkgver.tar.gz"
        "zeronet.conf"
        "zeronet.service")
install="zeronet.install"
backup=("etc/zeronet.conf")
options=(!strip) # ignore test binaries in the depsendency libs that fail strip

# Upstream uses camel case
_pkgarchive="ZeroNet-$pkgver"

package() {
   mkdir -p "$pkgdir/opt/zeronet"

   # There is no setup.py shipped, so brute-force copy
   cp -a "$srcdir/$_pkgarchive/." "$pkgdir/opt/zeronet/"

   install -D -m644 "$srcdir/zeronet.conf" "$pkgdir/etc/zeronet.conf"
   install -D -m644 "$srcdir/zeronet.service" "$pkgdir/usr/lib/systemd/system/zeronet.service"

   install -D -m644 "$srcdir/$_pkgarchive/LICENSE" "$pkgdir/usr/share/licenses/$_pkgarchive/LICENSE"
}

sha256sums=('78a27e1687d8e3699a854b77b516c95b30a8ba667f7ebbef0aabf7ec6ec7272d'
            '34c349ab5a233afd64e8a9c1d2140c7380fe6c730ed55fb08c6ca4c3a2fa6a89'
            '398965191fb95f78849d12ea6b8a2c475b702456c541e5971c77d11a47d15827')
sha256sums=('78a27e1687d8e3699a854b77b516c95b30a8ba667f7ebbef0aabf7ec6ec7272d'
            '289b4292b1a9346fbefc2bd8c2bb12c2fe7b5bc630dbdfabc778b0a23a16941c'
            '398965191fb95f78849d12ea6b8a2c475b702456c541e5971c77d11a47d15827')
