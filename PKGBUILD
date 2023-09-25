# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=meowfetch-git
_shortpkgname=meowfetch
pkgdesc=' minimal, fast and customizable system information program written in go.'
arch=('x86_64')
url='https://github.com/Itsnexn/meowfetch'
pkgrel=4
license=('MIT')
makedepends=('go' 'git')
source=('git+https://github.com/Itsnexn/meowfetch')
md5sums=('SKIP')
provides=($_shortpkgname)
conflicts=($_shortpkgname)
pkgver=1.0.1.e5424be

pkgver() {
	cd meowfetch
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}


build() {
	cd $srcdir/meowfetch
    pwd
    GOOS=linux go build -ldflags="-w -s" -o build/meowfetch
}

package() {
	cd meowfetch
	install -Dm755 build/meowfetch "$pkgdir/usr/bin/meowfetch"
    install -Dm644 meowfetch.1 "$pkgdir/usr/share/man/man1/meowfetch.1"
    install -Dm755 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
