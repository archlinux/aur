# Maintainer: NebulaNeko <chfsefefgesfen foxmail>
_pkgname=pandownload
pkgname=${_pkgname}-bin
pkgver=2.1.3
pkgrel=6
pkgdesc="一款支持全平台的超级快的网盘下载工具，能真正不限速高速下载。"
arch=('any')
url="http://pandownload.com"
license=('unknown')
depends=(wine bash hicolor-icon-theme)
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
sha512sums=('d68485c4d5e95c72f8e70823b7572cb0aaf9d78cc31d246772136a5cf51aee488a83e536a9615bc7e67299626c9f1bdf10818b36d9fbe01172628c83e7cef1d7'
            'f92318c37e6ac4ef6a1c4b629a042b6dc1fbaac2188293a1c7afd42c4e674056167193d7bfbaeb041b3989300594ccf46e6ae97cbd7dc9879cca65bf24b6b9a6'
            '37cf6629cd5c52ba34d1e6f5a02caa5d398990d54e7a6ffd09ca3ce4038b793e3edbfe0940e358c74b003654f5fa8cda3f762aa7a9704e918216a6aa6ebc5303'
            '2888de2ca54d30368c9456e9866dc98fe9d106a6d58fd0f0cf91448a8b79067cb2adcc86b3aaad52c38d82ca9d86200d770056a0141030a2ec21ff8ed3355b09'
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
