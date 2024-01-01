# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
pkgname=chatbox-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64 aarch64)
url="https://chatboxapp.xyz"
license=('GPL')
depends=(electron bash hicolor-icon-theme)
provides=(chatbox)
source=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-amd64.deb")
sha256sums=('04ba834634dbdee9b902e1a60788aadb8e74c43a61a81250467fdbcf3d370548')

package() {
	tar -xvpf data.tar.xz -C $pkgdir
	find $pkgdir/opt -type f -not -path "*/resources/*" -delete
	printf "#!/bin/sh
electron /opt/Chatbox/resources/app.asar
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/chatbox
	find $pkgdir -name "*.desktop" -exec sed -i -r "s/Exec=.*/Exec=chatbox/" {} \;
}
