# Maintainer: Juneidy Wibowo <git@juneidy.wibowo.xyz>
# Contributor: Narthana Epa <narthana.epa@gmail.com>
# Contributor: Jack Mitchell <jack@embed.me.uk>

pkgname=buildkite-agent-bin
pkgver=3.98.1
pkgrel=1
pkgdesc='The Buildkite Agent'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://buildkite.com/docs/agent/v3'
license=('MIT')
options=('!strip' 'staticlibs')
backup=('etc/buildkite-agent/buildkite-agent.cfg')
install="$pkgname.install"
source=(
  "https://raw.githubusercontent.com/buildkite/agent/v$pkgver/packaging/linux/root/usr/share/buildkite-agent/systemd/buildkite-agent.service"
  "https://raw.githubusercontent.com/buildkite/agent/v$pkgver/packaging/linux/root/usr/share/buildkite-agent/systemd/buildkite-agent@.service"
  "https://raw.githubusercontent.com/buildkite/agent/v$pkgver/packaging/linux/root/usr/share/buildkite-agent/buildkite-agent.cfg"
  "buildkite-agent.sysusers"
  "buildkite-agent.tmpfiles"
)
source_x86_64=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-amd64-$pkgver.tar.gz")
source_armv7h=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-armhf-$pkgver.tar.gz")
source_aarch64=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-arm64-$pkgver.tar.gz")

sha256sums=('474a87811a15194e01097af13e0ce21b8a2ab0354e15bacead54e272087bc2c2'
            '4cc4ed6f3850396954baa65905085889e28bbf69c688dc8ea3f962762d401593'
            '08a25426ef7a0bd40555e1e8833c782b366df4e1dcd6c7386281c7bb23171f15'
            '60503a6e93dfdb533cd54c82bf9aa3087c907ce8c574b657ca4c4b102badcf71'
            '15f1019081d8255ac6ac121445ae4b39ef5e3f1446a319855c1f7524372366b0')
sha256sums_x86_64=('395f0f327e60ae7eaa9dc95444c0e8ee73f82034cc056aec31255c9e9ab6beea')
sha256sums_armv7h=('4d5e9cf364284811128098c7d73c6ddf41f411fc098fe59e00ff78544b9711b2')
sha256sums_aarch64=('ac8c6cc2662f226d36251d6e60e09b42c6e9f3a9b819ec3971386249a3ae5a3f')

package() {
  install -dm 755 "$pkgdir/etc/buildkite-agent/hooks"
  install -dm 755 "$pkgdir/etc/buildkite-agent/plugins"

  install -Dm 755 buildkite-agent "$pkgdir/usr/bin/buildkite-agent"

  install -Dm 644 buildkite-agent.cfg "$pkgdir/etc/buildkite-agent/buildkite-agent.cfg"
  install -Dm 644 buildkite-agent.service "$pkgdir/usr/lib/systemd/system/buildkite-agent.service"
  install -Dm 644 buildkite-agent@.service "$pkgdir/usr/lib/systemd/system/buildkite-agent@.service"
  install -Dm 644 buildkite-agent.sysusers "$pkgdir/usr/lib/sysusers.d/buildkite.conf"
  install -Dm 644 buildkite-agent.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/buildkite.conf"
}

# vim: ts=2 sw=2 et:
