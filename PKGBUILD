# Maintainer:  Piotr Balwierz <parseByHuman(surname at email_service_of_google)>

pkgname=igv-beta
pkgver=3.0.0_beta.8
_pkgver=${pkgver//_/-}   # upstream uses a hyphen: 3.0.0-beta.3
_minor_pkgver=$(<<<$pkgver sed -E 's/^([0-9]+\.[0-9]+)\..*/\1/')
pkgrel=1
pkgdesc="High-performance visualization tool for interactive exploration of large, integrated genomic datasets. From Broad Institute. (3.0 beta release)"
arch=('any')
url="https://igv.org/"
license=('MIT')
depends=('jre21-openjdk' 'archlinux-java-run' 'sh')
# Parallel-installable with the stable 'igv' package: everything is namespaced
# under igv-beta, so no conflicts/provides are declared.
source=("https://data.broadinstitute.org/igv/projects/downloads/${_minor_pkgver}/IGV_Linux_${_pkgver}_WithJava.zip"
        "$pkgname.sh"
        "${pkgname}_hidpi.sh"
        "$pkgname.desktop"
        "${pkgname}_hidpi.desktop"
        "${pkgname}-license.txt::https://raw.githubusercontent.com/igvteam/igv/v${_pkgver}/license.txt"
        "${pkgname}.png::https://raw.githubusercontent.com/igvteam/igv/v${_pkgver}/examples/web/IGV_64.png")
sha512sums=('d39f25acb4c2b48175190803c5601169fa906d466b46704a120c16d7fc76cd6aa2effd0bc69e5d8b137ff6b8d084179f3c3684ff72b74faeb17fe45abae1bf2f'
            '3849533551d62e3b2a7a3653a77752841bc7e270ff37bd14007ccebd5fbaa0aceef1a60c29025a8e43a53ba33b4d31b8aec3b59979f17782fc5cdeeee6b67090'
            '079f5c517a21a2baf800d7caf7e241d32be4ceab6cc35c8d36c8221dc6568d6a37e05e4e652c1c9d27de811f51efa49d1c51f863f1f446aa9de7c9115a1ee587'
            '3fa3a854a1f4ed73c44c20bbf12ed2e9c9ee642bee0144f34d3efc34997c4dc8122d7975914d2709b8434f45ff81d3af12846feba322dbff4e4c08f3dbcf113f'
            '496e1bf53a03f88b9bca1eda35ffb04cca262adae8150aea64a17f1a295eaa0e7996f321344369a1695a45e400e15a5a884840dd113a30922e2c3f71ed43048a'
            '07ddbb66eac696c3f1489e1fef1c3fa6371354de228085d5992bfe79f009191f0d60a02d0ab16ce6dc83780d9019cac0d315f8c1ddd1d159ba3ea554530838ac'
            '42a3924c7022fab7ed3598fe5a8524127a7386fb9bf6d71e90f1e85e0087b551797806b0c24679ce8fa24b6a448f55942f934e438bd18623d76711571affa296')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 "${pkgname}_hidpi.sh" "$pkgdir"/usr/bin/"${pkgname}_hidpi"
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "${pkgname}_hidpi.desktop" "$pkgdir"/usr/share/applications/"${pkgname}_hidpi".desktop
  install -Dm644 ${pkgname}-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 ${pkgname}.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  cd IGV_Linux_${_pkgver}
  install -Dm644 igv.args "$pkgdir"/usr/share/java/$pkgname/igv.args
  install -Dm644 lib/* -t "$pkgdir"/usr/share/java/$pkgname/lib/
}
