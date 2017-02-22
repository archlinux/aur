# Contributor: hexchain <i at hexchain dot org>
# Maintainer: hexchain <i at hexchain dot org>

pkgbase=ca-certificates-blacklist
pkgname=('ca-certificates-blacklist-cnnic' 'ca-certificates-blacklist-wosign' 'ca-certificates-blacklist-startcom')
pkgver=3.29.1
pkgrel=1
pkgdesc="A set of broken CAs' certificates which should not be trusted"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(any)
license=('MPL' 'GPL')
depends=('ca-certificates-utils')
makedepends=('python2')
source=("https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_${pkgver//./_}_RTM/src/nss-${pkgver}.tar.gz"
        "certdata2pem.py")

prepare() {
    mkdir -p certs

    cd "nss-$pkgver"
    ln -sfr nss/lib/ckfw/builtins/certdata.txt ../certs/
}


build() {
    cd certs
    python2 ../certdata2pem.py
}

package_ca-certificates-blacklist-cnnic() {
    pkgdesc="$pkgdesc (CNNIC only)"
    cd "$srcdir/certs"
    install -Dm644 -t "$pkgdir/usr/share/ca-certificates/trust-source/blacklist/" \
        CNNIC_ROOT\:2.4.73.51.0.1.crt \
        China_Internet_Network_Information_Center_EV_Certificates_Root\:2.4.72.159.0.1.crt
}

package_ca-certificates-blacklist-wosign() {
    pkgdesc="$pkgdesc (WoSign only)"
    cd "$srcdir/certs"
    install -Dm644 -t "$pkgdir/usr/share/ca-certificates/trust-source/blacklist/" \
        CA_WoSign_ECC_Root:2.16.104.74.88.112.128.107.240.143.2.250.246.222.232.176.144.144.crt \
        Certification_Authority_of_WoSign_G2:2.16.107.37.218.138.136.157.124.188.15.5.179.177.122.97.69.68.crt \
        WoSign:2.16.94.104.214.17.113.148.99.80.86.0.104.243.62.201.197.145.crt \
        WoSign_China:2.16.80.112.107.205.216.19.252.27.78.59.51.114.210.17.72.141.crt
}

package_ca-certificates-blacklist-startcom() {
    pkgdesc="$pkgdesc (StartCom only)"
    cd "$srcdir/certs"
    install -Dm644 -t "$pkgdir/usr/share/ca-certificates/trust-source/blacklist/" \
        StartCom_Certification_Authority:2.1.1.crt \
        StartCom_Certification_Authority:2.1.45.crt \
        StartCom_Certification_Authority_G2:2.1.59.crt
}

sha256sums=('47259bc5c4439d8228d7c577ea652ed140588f27eae8ebb39cc91057aea37366'
            '2a2ff9131c21fa3b23ad7c7a2f069eabc783e56c6eb05419ac5f365f48dea0fc')
