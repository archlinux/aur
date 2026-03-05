pkgname=yt-audio-dl-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="YouTube Audio Downloader using yt-dlp and Flutter"
arch=('x86_64')
url="https://github.com/thep1ckaxe91/Youtube-Audio-Downloader"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
provides=('yt-audio-dl')
conflicts=('yt-audio-dl')
source=("yt-audio-dl-bin-${pkgver}.tar.gz::https://raw.githubusercontent.com/thep1ckaxe91/Youtube-Audio-Downloader/main/yt-audio-dl-bin/yt-audio-dl-bin-${pkgver}.tar.gz"
        "yt-audio-dl.desktop::https://raw.githubusercontent.com/thep1ckaxe91/Youtube-Audio-Downloader/main/yt-audio-dl-bin/yt-audio-dl.desktop")

sha256sums=('903edc27cb75de3a015a37dbdd989364169d0fec966bd10c69e9a899d3430fc5'
            'd96b17c3a6922a62ed0c7a251fdff4d58abc01f6206a75d2a59ab38b49314d48')

package() {
    install -d "${pkgdir}/opt/yt-audio-dl"
    
    cp -r "${srcdir}/bundle/"* "${pkgdir}/opt/yt-audio-dl/"
    
    chmod -R u=rwX,go=rX "${pkgdir}/opt/yt-audio-dl"
    chmod +x "${pkgdir}/opt/yt-audio-dl/yt_audio_dl"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/yt-audio-dl/yt_audio_dl" "${pkgdir}/usr/bin/yt-audio-dl"

    install -Dm644 "${srcdir}/yt-audio-dl.desktop" "${pkgdir}/usr/share/applications/yt-audio-dl.desktop"
}
