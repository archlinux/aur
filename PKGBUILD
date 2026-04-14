# Maintainer: scientificworld <scientificworld at 126 dot com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: jtmb <packaging at technologicalwizardry dot com>
# Contributor: Dct Mei <dctxmei@yandex.com>

pkgname=hath
pkgver=1.6.5
pkgrel=1
pkgdesc="Open-source Peer-2-Peer gallery distribution system"
arch=('any')
url="https://ehwiki.org/wiki/Hentai@Home"
license=('GPL-3.0-only')
depends=('java-runtime')
makedepends=('java-environment')
install="$pkgname.install"
source=("https://repo.e-hentai.org/hath/HentaiAtHome_${pkgver}_src.zip"
        "hath.service"
        "hath.sh"
        "hath.sysusers"
        "hath.tmpfiles")
sha256sums=('d2aab9bf9029c59b2f4a6e2ea8e8e1a0a4db66d22109c03aea57df58a6b8619d'
            '4b7124af5e27d25a9b3033b2a14e48ea8745417c3fd400a6ec6ddf1817b74b61'
            '80064d7e31085b56ad5b41863f51b25c33a20328a7f49cd88f80dfed281c439a'
            '0c3a1a6c26cec616bc44274acbf5908e736581ae30cdf0af7508d4bfcad3a81e'
            '9d11932a3ff1011cbe5ad2f000d29e3ad6011235fcc94685dcbc9bd61a54f87c')

build() {
    make
    make jar
}

package() {
    install -Dm 644 'build/HentaiAtHome.jar' "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm 644 'hath.service' "$pkgdir/usr/lib/systemd/system/hath.service"
    install -Dm 755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 'hath.sysusers' "$pkgdir/usr/lib/sysusers.d/hath.conf"
    install -Dm 644 'hath.tmpfiles' "$pkgdir/usr/lib/tmpfiles.d/hath.conf"
    install -Dm 644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
