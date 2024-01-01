# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
pkgname=chatbox-bin
pkgver=1.2.2
pkgrel=2
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64 aarch64)
url="https://chatboxapp.xyz"
license=('GPL')
depends=(electron bash hicolor-icon-theme)
provides=(chatbox)
install=.install

source=(.install)
source_x86_64=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-amd64.deb")

source_aarch64=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-arm64.deb")
sha256sums=('597d64a01d6cff6ca39549363a5ffe9142691ad9a2f4ed3369912cbf2391230b')
sha256sums_x86_64=('04ba834634dbdee9b902e1a60788aadb8e74c43a61a81250467fdbcf3d370548')
sha256sums_aarch64=('e1d48f491b2edc596fa68670507c3e787212a3eacf723f470b0e9beedaf8e66a')

package() {
	tar -xvpf data.tar.xz -C $pkgdir
	# find $pkgdir/opt -type f -not -path "*/resources/*" -delete
	printf "#!/bin/sh
exec /opt/Chatbox/xyz.chatboxapp.app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/chatbox
	find $pkgdir -name "*.desktop" -exec sed -i -r "s/Exec=.*/Exec=chatbox/" {} \;
}
