# Maintainer: Ralph Zhou <ralph-zhou@qq.com>

pkgname=lizzie-improve
_pkgname=lizzie
pkgver=20230615
_pkgver=2.5.3
_zipname=2023-06-15-Macosx.amd64.Linux.amd64.without.engine
_filename="2023-06-15-Macosx(amd64)+Linux(amd64)"
pkgrel=1
pkgdesc="Analysis interface for KataGo/Leela Zero, more features added by yzy"
arch=('x86_64')
url="https://github.com/yzyray/lizzieyzy"
license=('GPLv3')
depends=('bash' 'java-runtime' 'unzip')
makedepends=('git')
provides=('lizzie')
conflicts=('lizzie') 
source=("https://github.com/yzyray/lizzieyzy/releases/download/$_pkgver/$_zipname.zip"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt"
        "lizzie.png")
sha256sums=('fc956e3fbc122db0dceec1d25cd683c171b3cfff5c2654d111e7fef9a14615ba'
    '7c003e045833fa24962e3165c8f3a7fb9cb0e24443023a629c2a477f58b3c2d0'
        '964942565629e89f6859b238659c57b69028b33b93a142924ce308c6670120cb'
        '2d42917fd7a3b905696bcfcb7b0be96260cf88207db0cb4983e3082447fa7336'
        '642b3c1ae733b55ddc21cd6e242cac6ffb985cc152eed9da3245609986943140')

prepare(){
    unzip -o $_zipname.zip
}

package() {
  install -Dm644 "$_filename"/"linux(amd64)"/lizzie-yzy"$_pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
  install -Dm644 config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
        install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
        install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
        install -Dm644 "$_pkgname".png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/"$_pkgname".png
        cd $_filename/linux\(amd64\)
        for _file in sound/*.wav
        do
            install -Dm644 "${_file}" "$pkgdir"/usr/share/"$_pkgname"/sound/"$(basename ${_file})"
        done
}
