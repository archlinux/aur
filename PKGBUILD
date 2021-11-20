# Maintainer: Ralph Zhou <1694487365@qq.com>

pkgname=lizzie-improve
_pkgname=lizzie
pkgver=20211117
_pkgver=2.4.6.1
pkgrel=1
pkgdesc="Analysis interface for KataGo/Leela Zero, more features added by yzy"
arch=('x86_64')
url="https://github.com/yzyray/lizzieyzy"
license=('GPLv3')
depends=('bash' 'java-runtime' 'unzip')
makedepends=('git')
provides=('lizzie')
conflicts=('lizzie')
source=("https://hub.fastgit.org/yzyray/lizzieyzy/releases/download/2.4.6.1/2021-11-17-Mac+Linux64.zip"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt")
sha256sums=('ded204c40f966db741c98000fbbcba267a65eaf4e91d53db101510b9f102b6fc'
        'SKIP'
        'SKIP'
        'SKIP')
_zipname=2021-11-17-Mac+Linux64
prepare(){
    unzip -o "$_zipname.zip"
}
package() {

    install -Dm644 "$_zipname"/linux64/lizzie-yzy"$_pkgver"-shaded-linux64.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
        install -Dm644 config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
        install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
        install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
        for _file in $_zipname/linux64/sound/*.wav
        do
            install -Dm644 "${_file}" "$pkgdir"/usr/share/"$_pkgname"/sound/"$(basename ${_file})"
        done
}
