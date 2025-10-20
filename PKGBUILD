# Maintainer: Revincx <revincx233@gmail.com>
# Co-Maintainer: Mikata Riko <sanbikappa@qq.com>

pkgname='kikoplay-bin'
pkgver=2.0.0
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64' 'aarch64')
license=('GPL3' 'MIT')
url="https://github.com/KikoPlayProject/KikoPlay"
#depends=('mpv' 'lua53' 'qhttpengine' 'qt5-websockets')
makedepends=('git')
conflicts=('kikoplay' 'kikoplay-beta' 'kikoplay-git')
optdepends=('aria2: for downloading')
source_x86_64=(
    "https://github.com/KikoPlayProject/KikoPlay/releases/download/${pkgver}/kikoplay-amd64-full.deb"
)
source_aarch64=(
    "https://github.com/KikoPlayProject/KikoPlay/releases/download/${pkgver}/kikoplay-arm64-full.deb"
)
source=(
    "git+https://github.com/KikoPlayProject/KikoPlayScript"
    "git+https://github.com/KikoPlayProject/KikoPlayApp"
)
sha256sums_x86_64=(
    "172e512e56dae33f1f0daf0559f7776e1724a79174bc18f2c79f75d91ef5eecf"
)
sha256sums_aarch64=(
    "e3e6f4a2d682656d91a4a2952982dee8306b644417db06735ac66dc3732d8a7b"
)
sha256sums=(
    SKIP
    SKIP
)

package() {

    #cd "${srcdir}"
    ar x kikoplay*.deb
    tar -C "$pkgdir" --use-compress-program=unzstd -xvf data.tar.zst

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/kikoplay/bin/KikoPlay "${pkgdir}/usr/bin/kikoplay"
    ln -sf /opt/kikoplay/bin/KikoPlay "${pkgdir}/usr/bin/KikoPlay"
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/script"
    cp -r "${srcdir}"/KikoPlayScript/{bgm_calendar,danmu,library,match,resource} "${pkgdir}/usr/share/kikoplay/extension/script"
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/app"
    cp -r "${srcdir}"/KikoPlayApp/app/* "${pkgdir}/usr/share/kikoplay/extension/app"

    install -dm755 "${pkgdir}/usr/share/doc/kikoplay/KikoPlayScript"
    cp "${srcdir}"/KikoPlayScript/*.md "${pkgdir}/usr/share/doc/kikoplay/KikoPlayScript"
    install -dm755 "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"
    cp "${srcdir}"/KikoPlayApp/*.md "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"
    cp -r "${srcdir}"/KikoPlayApp/api/* "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"

    install -Dm644 "${srcdir}/KikoPlayScript/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlayScript.license"
    install -Dm644 "${srcdir}/KikoPlayApp/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlayApp.license"
    ln -sf /usr/share/licenses/spdx/GPL-3.0-only.txt "${pkgdir}/usr/share/licenses/kikoplay/KikoPlay.license"
}
