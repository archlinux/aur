# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=iptvorg-epg
pkgver=2023.12.1
pkgrel=1
pkgdesc='Utilities for downloading the EPG (Electronic Program Guide) for thousands of TV channels from hundreds of sources'
arch=(any)
url=https://github.com/iptv-org/epg
license=(Unlicense)
depends=(
	python
	libxml2
	nodejs
	npm
	subversion
)
makedepends=(
	nodejs
	npm
)
source=(
	https://github.com/iptv-org/epg/archive/refs/tags/${pkgver}.tar.gz
	iptvorg-epg.sh
	my.channels.xml
)
sha256sums=('21a6654911daf24d7ed6abf8e2fcb1c7331b3cce64053a96faead3fbe98e9fb3'
            'ad34a8ffa2e719349d3b974793af85b348892536eb0126d764cac71d48cfcd5b'
            '26e87976d170c78e458ac44e65d305374aef67d2ab44a17bce151e86a2b783e5')

build() {
	cd epg-$pkgver
	npm i --cache ../npm-cache
	cd ..
	bsdtar -a -cf epg-$pkgver.tgz epg-$pkgver
}

package() {
	# Install npm application
	install -d "$pkgdir"/usr/share/$pkgname "$pkgdir"/usr/bin
	install -Dm644 epg-$pkgver.tgz "$pkgdir"/usr/share/$pkgname
	# Install executable and license
	install -Dm755 iptvorg-epg.sh "$pkgdir"/usr/bin/iptvorg-epg
	install -Dm644 epg-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	# Install example custom-channels-xml file
	install -Dm644 my.channels.xml "$pkgdir"/usr/share/$pkgname/my.channels.xml
}
