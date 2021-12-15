# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer:  Piotr Balwierz <parseByHuman(surname at email_service_of_google)>
# Co-maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=igv
pkgver=2.11.6
minor_pkgver=$(<<<$pkgver sed -E 's/^([0-9]+\.[0-9]+)\..*/\1/')
_pkgver=${pkgver//_/-}   # currently not needed
pkgrel=1
pkgdesc="High-performance visualization tool for interactive exploration of large, integrated genomic datasets. From Broad Institute."
arch=('any')
url="http://www.broadinstitute.org/software/igv/home"
license=('MIT')
depends=('jre11-openjdk' 'archlinux-java-run' 'sh')
#"igv-$pkgver.tar.gz::https://github.com/igvteam/igv/archive/v$pkgver.tar.gz"
source=("https://data.broadinstitute.org/igv/projects/downloads/${minor_pkgver}/IGV_Linux_${pkgver}_WithJava.zip"
        "$pkgname.sh"
        "igv_hidpi.sh"
        "$pkgname.desktop"
        "igv_hidpi.desktop"
        "${pkgname}-license-2020.txt::https://raw.githubusercontent.com/igvteam/igv/master/license.txt"
        "https://github.com/igvteam/igv/blob/v${pkgver}/test/web/IGV_64.png")
sha512sums=('c858fb87ff3cfb38fbbc11237cb8b2b5bc02c350115cd29bf6a02ba422fecc34e00bef3ad4e4f0640429836cd0e9b88b3a0519e81b1b756a61d11eadedf579e1'
            '70de493d5188d6eedbd0bf7c74d41ce4829efab75e3a79b56f998326c209d0184f5d3624d6b85d01ad93f0462e785c314322ef4a9260ead6d747f1791ecbe649'
            '60c9c8c6f66259a4edafd1d58d1f1ebcda4450f7620d4c0fc987d5875c2fd531bc2a3159fcdb77975bf07002036e3544f4d301a31d1085ab24d576eea1f8adcb'
            'c6bd4fc8bb7e43ee0fe9a4709e716d015c678bdd8bcb897876c267ec48441e2383aebb26b80457d2238f79546537af3409aa698544dc0043ff2c921f18126662'
            '0d52cbd6adc2bf36f8b80acdb6d72b30d52e920b301e7af75ddee8d942c9f3467f7aa98129984ee269c6aaaacc703fb054ba2917e0d7dbce5620050623383e5b'
            '6bbe15b1d5aee6754938fd8918b3679f7365dceb2a071969dd0abc85e6e2aedca24c8f7ed886fa23b7b5b547cfd1a303e6ba48a59073ef103dfddabd97d6a6a8'
            '2b0ff694efc5d318ae74b1df0853d8381ea5e90bf742b0cd29e8b5dffe68dc07258607321591b1dc666e327d15cb31cb853708a9b1539d3c220dc7f9462ed734')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 "$pkgname"_hidpi.sh "$pkgdir"/usr/bin/"$pkgname"_hidpi
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$pkgname"_hidpi.desktop "$pkgdir"/usr/share/applications/"$pkgname"_hidpi.desktop
  install -Dm644 ${pkgname}-license-2020.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 IGV_64.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  cd IGV_Linux_${_pkgver}
  install -Dm644 igv.args "$pkgdir"/usr/share/java/$pkgname/igv.args
  install -Dm644 lib/* -t "$pkgdir"/usr/share/java/$pkgname/lib/
}
