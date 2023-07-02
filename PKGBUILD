# Maintainer: caryoscelus <caryoscelus at gmx dot com>
# Contributor: redfish <redfish at galactica dot pw>
# Contributor: Lothar_m <lothar_m at riseup dot net>

pkgname='zeronet-conservancy'
_gitname='zeronet-conservancy'
_gitroot='https://github.com/zeronet-conservancy/zeronet-conservancy.git'
pkgver=0.7.9
pkgrel=1
arch=('any')
url='https://github.com/zeronet-conservancy/zeronet-conservancy/'
depends=('python' 'python-gevent>=1.1.0' 'python-gevent-websocket'
	'python-msgpack>=0.4.4' 'python-websocket-client' 'python-rsa'
	'python-pysocks' 'python-pyasn1' 'python-pyasn1-modules'
	'python-bitcoinlib'
	'python-pyaes'
	'geoip2-database'
	'python-defusedxml'
	'python-rich'
	'python-base58' 'python-merkletools'
)
optdepends=('tor: anonymity'
	    'namecoin-core: local name resolution')
makedepends=('git')
checkdepends=('python-pytest' 'python-mock')
license=('GPL3')
pkgdesc="modern client for decentralized p2p web platform 0net"
provides=(zeronet)
conflicts=(zeronet)
source=("git+https://github.com/zeronet-conservancy/zeronet-conservancy.git#tag=v${pkgver}"
        "zeronet.conf"
        "zeronet.service")
install="zeronet.install"
backup=("etc/zeronet.conf")
options=(!strip) # attempt to strip binaries fromA dependent libs fial

package() {
   cd "$srcdir/$_gitname"

   mkdir -p "$pkgdir/opt/zeronet"

   # There is no setup.py shipped, so brute-force copy
   cp -a "$srcdir/$_gitname/." "$pkgdir/opt/zeronet/"

   install -D -m644 "$srcdir/zeronet.conf" "$pkgdir/etc/zeronet.conf"
   install -D -m644 "$srcdir/zeronet.service" "$pkgdir/usr/lib/systemd/system/zeronet.service"

   # install license
   install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('SKIP'
            'ea735e82dbb10a2c1fda7abfeb2f38c2429044d8254f9e2396c50cecb6f778f8'
            '2ee64a1b671a49a1626901a11d4d7fa338c77cb9b7c9facd2f56b087a4a0bb83')
