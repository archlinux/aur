# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=q-dns-git
_shortpkgname=q-dns
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=('x86_64' 'aarch64')
url='https://github.com/natesales/q'
pkgrel=2
license=('GPL-3.0')
makedepends=('go' 'git')
source=('git+https://github.com/natesales/q')
md5sums=('SKIP')
provides=($_shortpkgname)
conflicts=($_shortpkgname)
pkgver=0.12.0.5dfb474

pkgver() {
	cd q
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}


build() {
	cd q
	go build -ldflags="-s -w -X main.version=$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g') -X main.commit=$(git rev-parse --verify HEAD) -X main.date=$(date --iso-8601=date)"
}

package() {
	cd q
	install -Dm755 q "$pkgdir/usr/bin/q"
    install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
