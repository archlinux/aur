# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=iptvorg-epg
pkgver=1.2
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
	git
	nodejs
	npm
)
_commit=48d8f1aca2f56a6b03ce737550978843f5f00117
source=(
	git+https://github.com/iptv-org/epg.git#commit=${_commit}
	iptvorg-epg.sh
	my.channels.xml
)
sha256sums=('SKIP'
            '907a7ba7ce1fadd362fd47b4fd4466da565bdb38e124a9412e83eeb9ce48227a'
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
