# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=iptvorg-epg
pkgver=1.0
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
)
makedepends=(
	git
	nodejs
	npm
)
_commit=a4663a218e8eb673fc53f0e10870d8462645a765
source=(
	git+https://github.com/iptv-org/epg.git#commit=${_commit}
	iptvorg-epg.sh
	my.channels.xml
)
sha256sums=('SKIP'
            '1174719bb3f96266b0e0dbca43b987053505f8e9bb6ec6d281a3a52a6b36e3fa'
            '26e87976d170c78e458ac44e65d305374aef67d2ab44a17bce151e86a2b783e5')

build() {
	cd epg
	npm i --cache ../npm-cache
}

package() {
	# Install npm application
	install -d "$pkgdir"/usr/share "$pkgdir"/usr/bin
	cp -a --no-preserve=ownership epg "$pkgdir"/usr/share/$pkgname
	# Install executable and license
	install -Dm755 iptvorg-epg.sh "$pkgdir"/usr/bin/iptvorg-epg
	install -Dm644 epg/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	# Install example custom-channels-xml file
	install -Dm644 my.channels.xml "$pkgdir"/usr/share/$pkgname/my.channels.xml
}
