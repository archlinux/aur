# Maintainer: Ralph Zhou <ralph-zhou@qq.com>

pkgname=lizzie-improve
_pkgname=lizzie
pkgver=20220803
_pkgver=2.5.1
pkgrel=2
pkgdesc="Analysis interface for KataGo/Leela Zero, more features added by yzy"
arch=('x86_64')
url="https://github.com/yzyray/lizzieyzy"
license=('GPLv3')
depends=('bash' 'java-runtime' 'unzip')
makedepends=('git')
provides=('lizzie')
conflicts=('lizzie')
_filename=2022-08-03-other-systems
_zipname=2022-08-03-other-systems.without.engine
source=("https://github.com/yzyray/lizzieyzy/releases/download/2.5.1/$_zipname.zip"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt")
sha256sums=('3cda6af3a425022c9055647aa583d9ab8eb1b181a01e741b121fa432f672d8e9'
        '7c003e045833fa24962e3165c8f3a7fb9cb0e24443023a629c2a477f58b3c2d0'
        'cf5d1651023f04294e580243aa7ef05bc9ebedb468631f4035fd3d5ce0f212f0'
        '2d42917fd7a3b905696bcfcb7b0be96260cf88207db0cb4983e3082447fa7336')
prepare(){
    unzip -o "$_zipname.zip"
}
package() {

    install -Dm644 "$_filename"/Lizzieyzy/lizzie-yzy"$_pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
        install -Dm644 config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
        install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
        install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
        for _file in $_filename/Lizzieyzy/sound/*.wav
        do
            install -Dm644 "${_file}" "$pkgdir"/usr/share/"$_pkgname"/sound/"$(basename ${_file})"
        done
}
