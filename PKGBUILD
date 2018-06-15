pkgname=matterbridge
pkgver=20180615
pkgrel=2
pkgdesc="mattermost to IRC/XMPP/slack/etc bridge"
arch=('x86_64')
url="https://github.com/42wim/matterbridge"
license=('APACHE')
makedepends=('go')
source=('matterbridge.service')
sha256sums=('b5161da9e2e16c1ee5dd40680307fb24d3f627956d1943da07b734589d6ac9f5')

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
