# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=slack-bin
pkgver=1.2.4
pkgrel=1
pkgdesc='Client of the Slack team communication service'
arch=('i686' 'x86_64')
url="https://slack.com"
license=(custom)

source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
sha256sums_i686=("df8fc12e885201bf8dba9c3a210b1be72a48461f2a0dae1d4035f2a56b489b1c")

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
sha256sums_x86_64=("c0e27464f1d5d4fe0f63b13ea96b7b28bd6695d76b49a00f63d5bdb0ddb59e33")

package() {
  install -d "${pkgdir}/opt/slack"

  echo "Extract ubuntu package"
  tar --extract --directory "${pkgdir}/opt/slack" --file "${srcdir}/data.tar.xz"

  install -d "${pkgdir}/usr/bin"
	ln -s ../../opt/slack/usr/share/slack/slack "${pkgdir}/usr/bin/slack"

  install -d "${pkgdir}/usr/share"
  ln -s ../../opt/slack/usr/share/slack "${pkgdir}/usr/share/slack"

  install -Dm644 "${srcdir}/usr/share/pixmaps/slack.png" "${pkgdir}/usr/share/pixmaps/slack.png"
  install -Dm644 "${srcdir}/usr/share/applications/slack.desktop" "${pkgdir}/usr/share/applications/slack.desktop"
  install -Dm644 "${srcdir}/usr/share/lintian/overrides/slack" "${pkgdir}/usr/share/lintian/overrides/slack"
  install -Dm644 "${srcdir}/usr/share/doc/slack/copyright" "${pkgdir}/usr/share/doc/slack/copyright"
}
