# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Sean Snell <ssnell @ lakecs.net>
# Contributor: TilmanV
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: Nick Bair <njbair at gmail dot com>

pkgname=bubbleupnpserver
pkgver=0.9.51
pkgrel=1
pkgdesc='UPnP/DLNA streaming, OpenHome renderer support and Chromecast transcoding'
arch=(any)
url='https://www.bubblesoftapps.com/bubbleupnpserver2/'
license=('LicenseRef-BubbleUPnP-Server-EULA')
depends=('java-runtime-headless>=8')
optdepends=('ffmpeg: audio/video transcoding and media probing'
            'yt-dlp: local media URL extraction')
# https://www.bubblesoftapps.com/bubbleupnpserver2/docs/changelog.html
# Upstream downloads are unversioned and mutable. Keep date-based cache names
# per the co-maintainer's convention; pinned checksums still verify the content.
# Evaluate once so source, noextract and package() use the same timestamp.
_source_date=$(date +%F-%H)
source=(
  bubbleupnpserver.sh
  bubbleupnpserver.service
  bubbleupnpserver.config
  bubbleupnpserver-sysuser.conf
  "BubbleUPnPServer-distrib-${_source_date}.zip::https://bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip"
  "BubbleUPnPServer-${_source_date}.jar::https://bubblesoftapps.com/bubbleupnpserver/core/BubbleUPnPServer.jar"
)
noextract=("BubbleUPnPServer-${_source_date}.jar")
sha256sums=('89ca89f00f42bfc47c5edc75c5957b332967e1ccf818a0089c4e5a3b6c839d49'
            'd45511c42bde7d7a6823fb367910a67dbc245aa9a38d20849b60f07021c27e10'
            'f082a892697ce8aee78ef8c2321a396448e94bca9563c85b46006a7393360a75'
            '964d5b033fa1f491dd12e03382539ad515cf1893a92e19803490e901aa935bcd'
            'c82f8e22d795f91b34541db6c4f5a18d34c50cbb50e8a8772f4b46b522fa644e'
            '8f7dc1b819e8c34c4cd4b534059b2cf43117b9f93c4f61b387d0bd09c9c97b8a')
backup=('etc/conf.d/bubbleupnpserver.config')

package() {
  install -Dm644 "${srcdir}/BubbleUPnPServerLauncher.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/BubbleUPnPServerLauncher.jar"
  install -Dm644 "${srcdir}/BubbleUPnPServer-${_source_date}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/BubbleUPnPServer.jar"
  install -Dm755 "${srcdir}/bubbleupnpserver.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/bubbleupnpserver.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/bubbleupnpserver.config" \
    "${pkgdir}/etc/conf.d/bubbleupnpserver.config"
  install -Dm644 "${srcdir}/bubbleupnpserver-sysuser.conf" \
    "${pkgdir}/usr/lib/sysusers.d/bubbleupnpserver.conf"
  install -Dm644 "${srcdir}/LICENCE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.txt"
}
