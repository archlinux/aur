# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer:  Piotr Balwierz <parseByHuman(surname at email_service_of_google)>
# Co-maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=igv
pkgver=2.16.1
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
        "${pkgname}-license-2022.txt::https://raw.githubusercontent.com/igvteam/igv/master/license.txt"
        "https://raw.githubusercontent.com/igvteam/igv/v${pkgver}/test/web/IGV_64.png")
sha512sums=('b0fc2fcb23bc57faebe71950961e5df2275bf313b15865e4615b24eee40b9f7dc14e3e20c11affc7905cf38ff0f3ecfa6f4bfd89d6f4d09898670f6ec6dfe359'
            '70de493d5188d6eedbd0bf7c74d41ce4829efab75e3a79b56f998326c209d0184f5d3624d6b85d01ad93f0462e785c314322ef4a9260ead6d747f1791ecbe649'
            '60c9c8c6f66259a4edafd1d58d1f1ebcda4450f7620d4c0fc987d5875c2fd531bc2a3159fcdb77975bf07002036e3544f4d301a31d1085ab24d576eea1f8adcb'
            'c6bd4fc8bb7e43ee0fe9a4709e716d015c678bdd8bcb897876c267ec48441e2383aebb26b80457d2238f79546537af3409aa698544dc0043ff2c921f18126662'
            '0d52cbd6adc2bf36f8b80acdb6d72b30d52e920b301e7af75ddee8d942c9f3467f7aa98129984ee269c6aaaacc703fb054ba2917e0d7dbce5620050623383e5b'
            'cfa96e7c9822524e31fe42e948dbe4f0a190931e7723c44a6389b8a31a95a42775ccec5ed5905d24887612d832dfdf9e34aa10ec7d6cf32fb55f314b808fc7c6'
            '42a3924c7022fab7ed3598fe5a8524127a7386fb9bf6d71e90f1e85e0087b551797806b0c24679ce8fa24b6a448f55942f934e438bd18623d76711571affa296')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 "$pkgname"_hidpi.sh "$pkgdir"/usr/bin/"$pkgname"_hidpi
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$pkgname"_hidpi.desktop "$pkgdir"/usr/share/applications/"$pkgname"_hidpi.desktop
  install -Dm644 ${pkgname}-license-2022.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 IGV_64.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  cd IGV_Linux_${_pkgver}
  install -Dm644 igv.args "$pkgdir"/usr/share/java/$pkgname/igv.args
  install -Dm644 lib/* -t "$pkgdir"/usr/share/java/$pkgname/lib/
}
