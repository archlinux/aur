# Maintainer: Juneidy Wibowo <git@juneidy.wibowo.xyz>
# Contributor: Narthana Epa <narthana.epa@gmail.com>
# Contributor: Jack Mitchell <jack@embed.me.uk>

pkgname=buildkite-agent-bin
pkgver=3.115.0
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
sha256sums_x86_64=('7533ecc68c6f1df5b8ed1ee978de1e25fd35553aa230daf2f7b7fc2cd29afa39')
sha256sums_armv7h=('6c83698691d2b875bba7261f33e5f1dd1161c0d72abf2e15e1be36ca7411ded5')
sha256sums_aarch64=('c5d5495bcc6b0f5886f6658800bbefea3e0bb65eda630c9110e48311a37ab074')

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
