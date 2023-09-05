# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
pkgname=chatbox-bin
pkgver=0.6.8
pkgrel=1
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://chatboxapp.xyz"
license=('GPL')
depends=(electron22 bash hicolor-icon-theme)
provides=(chatbox)
source=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-amd64.deb")
sha256sums=('762bb507ddbc62e17cbdf52a889a66c1e857174c6736dff339a2accf4da3f1bc')

package() {
	tar -xvpf data.tar.xz -C $pkgdir
	find $pkgdir/opt -type f -not -path "*/resources/*" -delete
	echo -e "#!/bin/sh\nelectron22 /opt/Chatbox/resources/app.asar" | install -Dm755 /dev/stdin $pkgdir/usr/bin/chatbox
	find $pkgdir -name "*.desktop" -exec sed -i -r "s/Exec=.*/Exec=chatbox/" {} \;
}
