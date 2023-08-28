# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=webtunnel-client-git
pkgver=a2f9d5a6
pkgrel=3
pkgdesc="Pluggable Transport based on HTTP Upgrade(HTTPT) - Server"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel"
license=('custom:TorProject')
makedepends=('go' 'gcc' 'git')
options=('!emptydirs' '!strip')

# Source to compile to a specific commit
source=("git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel.git#commit=a2f9d5a60ee8b2b743f87885fd47917315d10b70"
				"https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel/-/raw/main/LICENSE")

sha256sums=('SKIP'
						'b9af8342b66eaa8f628db006c4e85f2cbf0a0823c2a86d941b546ff14fc8fe9c')

build(){
    export PATH=$PATH:$(go env GOPATH)/bin/
    cd ${srcdir}/webtunnel/main/client
    go build
}

package() {
    install -Dm755 "${srcdir}"/webtunnel/main/client/client -T "${pkgdir}"/usr/local/bin/webtunnel-client
	  install -Dm644 LICENSE -T "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
