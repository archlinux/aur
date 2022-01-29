# Maintainer: Ralph Zhou <ralph-zhou@qq.com>

pkgname=lizzie-improve
_pkgname=lizzie
pkgver=20220129
_pkgver=2.4.7
pkgrel=1
pkgdesc="Analysis interface for KataGo/Leela Zero, more features added by yzy"
arch=('x86_64')
url="https://github.com/yzyray/lizzieyzy"
license=('GPLv3')
depends=('bash' 'java-runtime' 'unzip')
makedepends=('git')
provides=('lizzie')
conflicts=('lizzie')
source=("https://github.com/yzyray/lizzieyzy/releases/download/2.4.7/2022-01-29-Mac+Linux64.zip"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt")
sha256sums=('0489f0365e664a150402b1c18f4227500b161b672bec2f9ec5e0f1b73131b2eb'
        'SKIP'
        'SKIP'
        'SKIP')
_zipname=2022-01-29-Mac+Linux64
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
