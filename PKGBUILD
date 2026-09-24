# Maintainer: anas1412 <anasbassoumi@gmail.com>
pkgname=tackora-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="A Kanban board for your coding agents: every ticket is a Claude Code session"
arch=('x86_64')
url="https://anas1412.github.io/tackora/"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib2' 'cairo' 'gdk-pixbuf2' 'dbus' 'git')
optdepends=('claude-code: the agent Tackora runs (or install it from claude.ai)'
            'github-cli: pull requests for worktree tickets')
provides=('tackora')
conflicts=('tackora')
options=('!strip' '!debug')
source=("https://github.com/anas1412/tackora/releases/download/v${pkgver}/Tackora_${pkgver}_amd64.deb"
        'LICENSE')
sha256sums=('6b857370770940a816206d93a397339f4444f8359ae5066c7a3a020a3c09bb72'
            '51f19ea24ca521fd6f8beb5b825112e06d5b7ae0a68d23dde6a52063cb1a3b53')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  # The .deb puts the 256px icon in a non-standard "256x256@2" folder.
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2" "${pkgdir}/usr/share/icons/hicolor/256x256"
  chmod 755 "${pkgdir}/usr/bin/tackora"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
