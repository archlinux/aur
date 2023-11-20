# Maintainer : Ho Kim <ho.kim@smartx.kr>

pkgname='kakaotalk'
pkgver=0.1.0
pkgrel=2
pkgdesc='A mobile messaging app for smartphones operated by Kakao Corporation in South Korea'
arch=(
    'i686'
    'x86_64'
)
source=(
    'https://www.kakao.com/ko/terms.html'
    'LICENSE'
    'kakaotalk'
    'kakaotalk.desktop'
    'kakaotalk.png'
)

url='https://www.kakaocorp.com/page/service/service/KakaoTalk'

license=(
    'custom:kakaotalk'
    'unlicense'
)

depends=(
    'bash'
    'curl'
    'desktop-file-utils'
    'wine'
    'xdg-utils'
)

sha256sums=(
    'SKIP'
    '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e'
    '2cec5a7c686f903f7312d608a01f4454135f9b936a4d9bb49d781128682dad5b'
    '5a62e97dc447a0740d92327264c538857f371f29aa8c1adbadafe6a38f835005'
    'bc6102b626e970adb084f8eb84cebef02ee189ea4e84857b6535b9c524c2872c'
)

update_desktop() {
    xdg-icon-resource forceupdate --theme hicolor &>/dev/null
    update-desktop-database -q
}

post_install() {
    update_desktop
}

post_upgrade() {
    post_install
}

post_remove() {
    update_desktop
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/kakaotalk"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/kakaotalk.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/kakaotalk.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/kakaotalk" "${srcdir}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/kakaotalk" "${srcdir}/terms.html"
}
