# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer:  Piotr Balwierz <parseByHuman(surname at email_service_of_google)>
# Co-maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=igv
pkgver=2.16.2
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
        "${pkgname}-license-2023.txt::https://raw.githubusercontent.com/igvteam/igv/master/license.txt"
        "https://raw.githubusercontent.com/igvteam/igv/v${pkgver}/test/web/IGV_64.png")
sha512sums=('4c0a1d8afd7518d40dd45e3bdf1aae6dc3767775971eb7ad03e53698895de7728fdf8e5026dd1cac425351fec477a6cdd8d959244415fcfb013358addc80781c'
            '70de493d5188d6eedbd0bf7c74d41ce4829efab75e3a79b56f998326c209d0184f5d3624d6b85d01ad93f0462e785c314322ef4a9260ead6d747f1791ecbe649'
            '60c9c8c6f66259a4edafd1d58d1f1ebcda4450f7620d4c0fc987d5875c2fd531bc2a3159fcdb77975bf07002036e3544f4d301a31d1085ab24d576eea1f8adcb'
            'c6bd4fc8bb7e43ee0fe9a4709e716d015c678bdd8bcb897876c267ec48441e2383aebb26b80457d2238f79546537af3409aa698544dc0043ff2c921f18126662'
            '0d52cbd6adc2bf36f8b80acdb6d72b30d52e920b301e7af75ddee8d942c9f3467f7aa98129984ee269c6aaaacc703fb054ba2917e0d7dbce5620050623383e5b'
            'ae986e63acc2d62af17315c3b3abcd54897bf418dd42b7c90a06d0e89550f4eebc887ed63be04f8880fe193f01bb12909306046b34e74905c125b8f0594937d4'
            '42a3924c7022fab7ed3598fe5a8524127a7386fb9bf6d71e90f1e85e0087b551797806b0c24679ce8fa24b6a448f55942f934e438bd18623d76711571affa296')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 "$pkgname"_hidpi.sh "$pkgdir"/usr/bin/"$pkgname"_hidpi
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$pkgname"_hidpi.desktop "$pkgdir"/usr/share/applications/"$pkgname"_hidpi.desktop
  install -Dm644 ${pkgname}-license-2023.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 IGV_64.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  cd IGV_Linux_${_pkgver}
  install -Dm644 igv.args "$pkgdir"/usr/share/java/$pkgname/igv.args
  install -Dm644 lib/* -t "$pkgdir"/usr/share/java/$pkgname/lib/
}
