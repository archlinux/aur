# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer:  Piotr Balwierz <parseByHuman(surname at email_service_of_google)>
# Co-maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=igv
pkgver=2.10.3
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
	#"http://www.broadinstitute.org/software/igv/sites/cancerinformatics.org.igv/files/images/tools.png"
	"$pkgname.sh"
	"igv_hidpi.sh"
	"$pkgname.desktop"
	"igv_hidpi.desktop"
	"${pkgname}-license-2020.txt::https://raw.githubusercontent.com/igvteam/igv/master/license.txt")
sha512sums=('9bc17ef2c35ada24c9308ac1f9df49212bfa28446748e89c428b08d33554ac15273c56f976c31938cd7785d85f452b10d08052ae43195e909374b5d820892687'
            #'e71a0dc70c717b3db00268632500b5723b8cddb1ecfbd8ce48b77ffad59bf93a8d275cc5ebd18b9eb1025200438ac55ec348def343b1b5f72a2c982b5dc4cc90'
            '70de493d5188d6eedbd0bf7c74d41ce4829efab75e3a79b56f998326c209d0184f5d3624d6b85d01ad93f0462e785c314322ef4a9260ead6d747f1791ecbe649'
            '60c9c8c6f66259a4edafd1d58d1f1ebcda4450f7620d4c0fc987d5875c2fd531bc2a3159fcdb77975bf07002036e3544f4d301a31d1085ab24d576eea1f8adcb'
            'c6bd4fc8bb7e43ee0fe9a4709e716d015c678bdd8bcb897876c267ec48441e2383aebb26b80457d2238f79546537af3409aa698544dc0043ff2c921f18126662'
            '0d52cbd6adc2bf36f8b80acdb6d72b30d52e920b301e7af75ddee8d942c9f3467f7aa98129984ee269c6aaaacc703fb054ba2917e0d7dbce5620050623383e5b'
            '6bbe15b1d5aee6754938fd8918b3679f7365dceb2a071969dd0abc85e6e2aedca24c8f7ed886fa23b7b5b547cfd1a303e6ba48a59073ef103dfddabd97d6a6a8')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 "$pkgname"_hidpi.sh "$pkgdir"/usr/bin/"$pkgname"_hidpi
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$pkgname"_hidpi.desktop "$pkgdir"/usr/share/applications/"$pkgname"_hidpi.desktop
  install -Dm644 ${pkgname}-license-2020.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  cd IGV_Linux_${_pkgver}
  install -Dm644 IGV_64.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 igv.args "$pkgdir"/usr/share/java/$pkgname/igv.args
  install -Dm644 lib/* -t "$pkgdir"/usr/share/java/$pkgname/lib/
}
