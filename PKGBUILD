# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer:  Piotr Balwierz <parseByHuman(surname at email_service_of_google)>
# Co-maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=igv
pkgver=2.17.3
_github_pkgver=$pkgver
minor_pkgver=$(<<<$pkgver sed -E 's/^([0-9]+\.[0-9]+)\..*/\1/')
_pkgver=${pkgver//_/-}   # currently not needed
pkgrel=1
pkgdesc="High-performance visualization tool for interactive exploration of large, integrated genomic datasets. From Broad Institute."
arch=('any')
url="http://www.broadinstitute.org/software/igv/home"
license=('MIT')
depends=('jre17-openjdk' 'archlinux-java-run' 'sh')
#"igv-$pkgver.tar.gz::https://github.com/igvteam/igv/archive/v$pkgver.tar.gz"
source=("https://data.broadinstitute.org/igv/projects/downloads/${minor_pkgver}/IGV_Linux_${pkgver}_WithJava.zip"
        "$pkgname.sh"
        "igv_hidpi.sh"
        "$pkgname.desktop"
        "igv_hidpi.desktop"
        "${pkgname}-license-2023.txt::https://raw.githubusercontent.com/igvteam/igv/v${_github_pkgver}/license.txt"
        "https://raw.githubusercontent.com/igvteam/igv/v${_github_pkgver}/docs/web/IGV_64.png")
sha512sums=('82b136142927a73e2157570816e8bbebe99ba6879a690c0f7aa69db60d0e72b36afb22be628bc179f2df837d692f8f593c32cf5e6957588558e89fbf91fd61a5'
            '9c81d153e90766131c8ad209c8d84369dc6a80cf8e993e3ae49cc19ab4a6be8a9d9570773f92ad3ba971eb21fee09b2d63b9eb78e773af4e57feff3a985fa501'
            '283bd4fa4fc2e69c9083299f6d015003e0687fc252d05aad54b66e1f1111225ac7f97ed00e57b93510d65156dcd04b86c2574521ae3141192908b78f0a864608'
            '668b6dc6621415298af2b1b57c7bc4cca5be5fd45c189d14bc90cb0e5d992b53eda806a058d1920b96451c0f441b8670931fad0382c4568498b9ba6e81f5d263'
            'ff9ec7e172ed69ff6a7cb6ebca7baf702fde4f702e59bc8cab6acbeb5e6cdf1884ec1fc53ec3ba0ca4960807f79edc5f0370c2780e3a6325b6faa61326a05533'
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
