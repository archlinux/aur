# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=gnunet-user
pkgver=0.13.1
pkgrel=1
pkgdesc="A framework for secure peer-to-peer networking - single user config"
arch=('any')
url="https://gnunet.org"
license=('AGPL')
provides=('gnunet')
conflicts=('gnunet')
depends=('gnutls' 'gnurl' 'libmicrohttpd' 'jansson' 'libsodium')
makedepends=('libextractor')
optdepends=('bluez: for bluetooth support'
            'opus: for conversation tool'
            'libpulse: for conversation tool'
            'libogg: for conversation tool'
            'nss: certutil binary, for gnunet-gns-proxy-setup-ca'
            'zbar: for gnunet-qr'
            'pbc: for Attribute-Based Encryption and Identity Provider functionality'
            'libgabe: for Attribute-Based Encryption and Identity Provider functionality'
            'miniupnpc: for traversing NAT boxes more reliably'
            'perl: for some utilities'
            'texlive-most: for gnunet-bcd'
            'python: for test-suite')
options=('!makeflags')
source=("https://ftpmirror.gnu.org/gnu/gnunet/gnunet-${pkgver}.tar.gz"
        "gnunet.service")
sha256sums=('03d76a852e7fd2fc87b7145cb6abd900f73e4ea6097f3caac9e7d9fe8b625696'
            'cc5ac23e64aa7c42efb86dfc8dd644f05b9b5d838e881642e8562374e7915825')

build() {
    cd "${srcdir}/gnunet-${pkgver}"

    ./configure --prefix=/usr --with-extractor
    make
}

package() {
    cd "${srcdir}/gnunet-${pkgver}"

    make DESTDIR="${pkgdir}" install
    install -Dm0644 "${srcdir}/gnunet.service" "${pkgdir}/usr/lib/systemd/user/gnunet.service"
}
