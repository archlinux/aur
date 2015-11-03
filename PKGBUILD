# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=slack-bin
pkgver=1.2.5
pkgrel=1
pkgdesc='Client of the Slack team communication service'
arch=('i686' 'x86_64')
url="https://slack.com"
license=(custom)

source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-i386.deb")
sha256sums_i686=("4fc65a3a24a65c4e4ace23ed527bc73087234da75c5a9d9cdfd7924699a96aac")

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
sha256sums_x86_64=("2368e2449f08272d8ce38a423f44ed0cd35c1e77ca3c0525f069d0790b6ec58f")

package() {
  install -d "${pkgdir}/opt/slack"

  echo "Extract ubuntu package"
  tar --extract --directory "${pkgdir}/opt/slack" --file "${srcdir}/data.tar.xz"

  install -d "${pkgdir}/usr/bin"
	ln -s ../../opt/slack/usr/share/slack/slack "${pkgdir}/usr/bin/slack"

  install -d "${pkgdir}/usr/share"
  ln -s ../../opt/slack/usr/share/slack "${pkgdir}/usr/share/slack"

  install -Dm644 "${pkgdir}/opt/slack/usr/share/pixmaps/slack.png" "${pkgdir}/usr/share/pixmaps/slack.png"
  install -Dm644 "${pkgdir}/opt/slack/usr/share/applications/slack.desktop" "${pkgdir}/usr/share/applications/slack.desktop"
  install -Dm644 "${pkgdir}/opt/slack/usr/share/lintian/overrides/slack" "${pkgdir}/usr/share/lintian/overrides/slack"
  install -Dm644 "${pkgdir}/opt/slack/usr/share/doc/slack/copyright" "${pkgdir}/usr/share/doc/slack/copyright"
}
