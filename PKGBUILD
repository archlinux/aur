# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=mlogtail-git
pkgver=r44.9c23c35
pkgrel=1
pkgdesc="Mail log tailing and simple stats collecting application"
arch=('any')
url="https://github.com/aadz/mlogtail"
license=('GPL')
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mlogtail::git+https://github.com/aadz/mlogtail.git')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	go get -u github.com/hpcloud/tail golang.org/x/sys/unix
  	go build 
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 mlogtail "$pkgdir/usr/bin/mlogtail"
}
sha256sums=('SKIP')
