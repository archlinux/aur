# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=pandownload
pkgname=${_pkgname}-bin
pkgver=2.2.2
pkgrel=2
pkgdesc="一款支持全平台的超级快的网盘下载工具，能真正不限速高速下载。"
arch=('any')
url="http://pandownload.com"
license=('unknown')
depends=(wine hicolor-icon-theme)
optdepends=('sqlite: get Firefox cookies')
source=("${_pkgname}-$pkgver.zip::http://pandownload.com/$pkgver"
        "${_pkgname}.desktop"
        pandownload-wrapper
        pdcookies
        msscript.tar.xz
        override-dll.reg
        "16x16.png"
        "48x48.png")
options=(!strip)
install=${pkgname}.install
sha512sums=('0e4c589a8e5a876418aa2ec6935aaef0d0b0b972afd9699fca59aaf1f9f0b3cdd56af17a19875952f590d12fc0b2505578bc58a297fb79614a010b6eec1772ae'
            '11d63d361a5ae981d59a81fea3943d774a54a0cb4863a0c1fb01ac6be852de9e039830063e924f4b02b89f0c0f605adbbaa3bf04438192d2e39eae922f8d604b'
            'a49ccf546de9ac54c6ae0027f9f3b0191e0293a11d3d183e64a7898af56f0a51332cd9197acf67f74c17e85062d1a6c6880314974c08e53fb5ecd348218a90b6'
            '049dffe543d066b5b6595cf91d6865706a22bfc5f4fe4b582db8f06ce5fab5466ef243b6383daa2f95cdc08e11ca22eb120b863b91fee4005b8bdff6eaa85ab0'
            'da9ecf93218c994e22dc2a79844a3aefa2bda2c97c9524f63980d66b344b8ecd9b28aaaf5811e7998f6e1cde943716545dfad67b83375e4d4e098e233c447a43'
            'db31364f91abb94ce77dadbe9ed4b257cd77d6b5d9a26f62d43d4e0651bbf78cc1226407cfd7acbf3cb9ab7f84b66277fe55c8c02d29f920228074e5ad9f33c4'
            '8ccabe478127382cc35b6e281bdd838fae03696602d60f359f9a1ce1b9c13383a98b9499ebd3cd8815a67a13cc60d31fb0fd2f8f8ae699c8431ee21cb6a055b8'
            '49aca598cf58917b14564d9fde26093824dfde310dff68133dcabcdc65be5f02d9c79be237294d403bad9e1fcb8b906a26020956023600b9e862aceaf4a16a97')


package() {
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/PanDownload" "$pkgdir/opt/${_pkgname}"

    install -Dm644 "$srcdir/msscript.ocx" "$pkgdir/opt/${_pkgname}/wine/msscript.ocx"
    install -Dm644 "$srcdir/override-dll.reg" "$pkgdir/opt/${_pkgname}/wine/override-dll.reg"

    find "$pkgdir"/opt -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/opt -type d -exec chmod 755 "{}" \;

    install -Dm755 "$srcdir/${_pkgname}-wrapper" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm755 "$srcdir/pdcookies" "$pkgdir/usr/bin/pdcookies"

    install -Dm644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

    local icon_size icon_dir
    for icon_size in 16 48; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -dm755 "$icon_dir"
        install -m644 "$srcdir/${icon_size}x${icon_size}.png" "$icon_dir/${_pkgname}.png"
    done
}
