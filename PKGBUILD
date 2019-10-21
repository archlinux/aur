# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: hexchain <i at hexchain dot org>

pkgname=ca-certificates-blacklist-anti-china
pkgver=3.47
pkgrel=1
pkgdesc="A set of Chinese CAs' certificates which should be avoided"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(any)
license=('MPL' 'GPL')
depends=('ca-certificates-utils')
makedepends=('python2')
source=("https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_${pkgver//./_}_RTM/src/nss-${pkgver}.tar.gz"
        "certdata2pem.py")
sha256sums=('6cd0c4438b616bdacc0b5f25ff1506b0d07ee97ea6c95d514c5487200a155fa7'
            '2a2ff9131c21fa3b23ad7c7a2f069eabc783e56c6eb05419ac5f365f48dea0fc')

prepare() {
    mkdir -p certs

    cd "nss-$pkgver"
    ln -sfr nss/lib/ckfw/builtins/certdata.txt ../certs/
}


build() {
    cd certs
    python2 ../certdata2pem.py
}

package() {
    cd "$srcdir/certs"
    install -Dm644 -t "$pkgdir/usr/share/ca-certificates/trust-source/blacklist/" \
        Certum_Root_CA:2.3.1.0.32.crt \
        Certum_Trusted_Network_CA:2.3.4.68.192.crt \
        Certum_Trusted_Network_CA_2:2.16.33.214.208.74.79.37.15.201.50.55.252.170.94.18.141.233.crt \
        GDCA_TrustAUTH_R5_ROOT:2.8.125.9.151.254.240.71.234.122.crt \
        CFCA_EV_ROOT:2.4.24.74.204.214.crt \
        VeriSign_Class_3_Public_Primary_Certification_Authority_-_G4:2.16.47.128.254.35.140.14.34.15.72.103.18.40.145.135.172.179.crt \
        VeriSign_Class_3_Public_Primary_Certification_Authority_-_G5:2.16.24.218.209.158.38.125.232.187.74.33.88.205.204.107.59.74.crt \
        VeriSign_Universal_Root_Certification_Authority:2.16.64.26.196.100.33.179.19.33.3.14.187.228.18.26.197.29.crt \
        Verisign_Class_1_Public_Primary_Certification_Authority_-_G3:2.17.0.139.91.117.86.132.84.133.11.0.207.175.56.72.206.177.164.crt \
        Verisign_Class_2_Public_Primary_Certification_Authority_-_G3:2.16.97.112.203.73.140.95.152.69.41.231.176.166.217.80.91.122.crt \
        Verisign_Class_3_Public_Primary_Certification_Authority_-_G3:2.17.0.155.126.6.73.163.62.98.185.213.238.144.72.113.41.239.87.crt
}
