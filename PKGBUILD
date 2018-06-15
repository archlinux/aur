pkgname=matterbridge
pkgver=20180615
pkgrel=1
pkgdesc="mattermost to IRC/XMPP/slack/etc bridge"
arch=('x86_64')
url="https://github.com/42wim/matterbridge"
license=('APACHE')
makedepends=('go')
source=('matterbridge.service')
sha256sums=('1d67db3c6c7049ae95ec5a255e51c4fe3e86326b2319a59221b163ec51120421')

build() {
	mkdir go
	cd go
	export GOPATH=`pwd`
	go get github.com/42wim/matterbridge
}

package() {
	cd "go"
	install -Dm0755 bin/matterbridge "$pkgdir"/usr/bin/matterbridge
	install -Dm0644 src/github.com/42wim/matterbridge/matterbridge.toml.sample "$pkgdir"/usr/share/doc/$pkgname/matterbridge.toml.sample
	install -Dm0644 src/github.com/42wim/matterbridge/matterbridge.toml.simple "$pkgdir"/usr/share/doc/$pkgname/matterbridge.toml.simple
	install -Dm0644 "$srcdir"/matterbridge.service "$pkgdir"/usr/lib/systemd/system/matterbridge.service
}
