# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=hivemind-ai-bin
_appname=Hivemind
pkgver=1.0.3
pkgrel=1
pkgdesc='Kanban board for running AI coding agents (Claude Code, OpenCode) across projects (prebuilt binary)'
arch=('x86_64')
url='https://github.com/BorisBrock/Hivemind'
license=('MIT')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'webkit2gtk-4.1')
optdepends=('claude-code: Claude Code agent'
            'opencode: OpenCode agent')
provides=('hivemind-ai')
# hivemind<=1.0.1 and hivemind-git are the old names of these packages, see hivemind-ai/PKGBUILD
conflicts=('hivemind-ai' 'hivemind<=1.0.1' 'hivemind-git')
# Ship the released binary as it is
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_appname}_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/BorisBrock/Hivemind/v$pkgver/LICENSE")
sha256sums=('c0ab23d91ac2def85b973da763405eb9d49d10fe4d50d377434d375cd99d2aed'
            '90bc9218c32fb04e7384d8acbbeac4ea255d0823d3c53fec70a3b6679ef604ae')

package() {
  # makepkg has already unpacked the .deb; its data archive holds the /usr tree
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
