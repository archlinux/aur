# Maintainer : Ho Kim <ho.kim@smartx.kr>

pkgname='kakaotalk'
pkgver=0.1.0
pkgrel=8
pkgdesc='A mobile messaging app for smartphones operated by Kakao Corporation in South Korea'
arch=(
    'i686'
    'x86_64'
)
source=(
    'terms.pdf::https://t1.kakaocdn.net/kakaocorp/pw/policy/files/20260221/%EC%B9%B4%EC%B9%B4%EC%98%A4%20%EC%84%9C%EB%B9%84%EC%8A%A4%20%EC%95%BD%EA%B4%80_20260221_F.pdf'
    'LICENSE'
    'kakaotalk'
    'kakaotalk.desktop'
    'kakaotalk.png'
)

url='https://www.kakaocorp.com/page/service/service/KakaoTalk'

license=(
    'LicenseRef-KakaoTalk'
    'Unlicense'
)

depends=(
    'bash'
    'coreutils'
    'curl'
    'desktop-file-utils'
    'grep'
    'procps-ng'
    'wine>=11'
    'winetricks'
    'xdg-utils'
)

optdepends=(
    'gst-plugins-good: for multimedia playback support'
    'gst-plugins-bad: for multimedia playback support'
)

sha256sums=(
    'SKIP'
    '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e'
    '80ef75d657ab2863f7e18d3062ad0fd9da17a4ae5132f261e3d485ef1cc71a72'
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
    install -Dm644 -t "${pkgdir}/usr/share/licenses/kakaotalk" "${srcdir}/terms.pdf"
}
