# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# Contributor: Harry Jeffery <harry|@|exec64|.|co|.|uk>
# Contributor: Chris Morgan <me@chrismorgan.info>

pkgname=prince-bin
pkgver=13.3
pkgrel=2
pkgdesc="Convert HTML documents to PDF with CSS"
arch=(x86_64 i686)
url='http://www.princexml.com/'
license=('custom')
depends=('ca-certificates-utils' 'fontconfig' 'libidn' 'libxml2')
provides=('princexml')
conflicts=('sdlpop' 'princexml')
replaces=('princexml')
backup=("etc/${pkgname%-bin}/license.dat")
source=('prince.sh')
source_x86_64=("http://www.princexml.com/download/${pkgname%-bin}-$pkgver-linux-generic-$arch.tar.gz")
source_i686=("http://www.princexml.com/download/${pkgname%-bin}-$pkgver-linux-generic-$arch.tar.gz")
sha256sums=('a02a6159dd0ae8b2a2440c21ed370fd5057148cc6633214f8bc48228d23138fb')
sha256sums_x86_64=('3c95f5815c451db3a401916c3962d2fd306ac6a4aab2f9295b681ce92dbcf388')
sha256sums_i686=('3c95f5815c451db3a401916c3962d2fd306ac6a4aab2f9295b681ce92dbcf388')

prepare() {
    cd "${pkgname%-bin}-${pkgver}-linux-generic-${CARCH}"
    mkdir -p "etc/${pkgname%-bin}"
    mv lib/prince/license/license.dat "etc/${pkgname%-bin}/"
    ln -sf "../../../../etc/${pkgname%-bin}/license.dat" lib/prince/license
    ln -sf "../../../../etc/ssl/certs/ca-certificates.crt" lib/prince/etc/curl-ca-bundle.crt
}

package() {
    cd "${pkgname%-bin}-${pkgver}-linux-generic-${CARCH}"
    install -Dm755 ../prince.sh "$pkgdir/usr/bin/prince"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}" LICENSE
    install -Dm644 -t "${pkgdir}/etc/${pkgname%-bin}/" "etc/${pkgname%-bin}/license.dat"
    mkdir -p "${pkgdir}/usr/lib/"
    cp -a lib/prince "${pkgdir}/usr/lib/"
}
