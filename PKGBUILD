# Maintainer: Ralph Zhou <ralph-zhou@qq.com>

pkgname=lizzie-improve
_pkgname=lizzie
pkgver=20220513
_pkgver=2.5.0
pkgrel=1
pkgdesc="Analysis interface for KataGo/Leela Zero, more features added by yzy"
arch=('x86_64')
url="https://github.com/yzyray/lizzieyzy"
license=('GPLv3')
depends=('bash' 'java-runtime' 'unzip')
makedepends=('git')
provides=('lizzie')
conflicts=('lizzie')
source=("https://github.com/yzyray/lizzieyzy/releases/download/2.5.0/2022-05-13-other-systems.zip"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt")
sha256sums=('392f2820ea3ce6028418bd1d264e76817129704db80dcc4949842caf12a08ad8'
        'SKIP'
        'SKIP'
        'SKIP')
_zipname=2022-05-13-other-systems
prepare(){
    unzip -o "$_zipname.zip"
}
package() {

    install -Dm644 "$_zipname"/Lizzieyzy/lizzie-yzy"$_pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
        install -Dm644 config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
        install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
        install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
        for _file in $_zipname/Lizzieyzy/sound/*.wav
        do
            install -Dm644 "${_file}" "$pkgdir"/usr/share/"$_pkgname"/sound/"$(basename ${_file})"
        done
}
