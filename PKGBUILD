# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Youngbin Han <sukso96100@gmail.com>
# Contributor: Andrew Kluger <evilgnome@gmail.com>
pkgname=micro-git
pkgver=v1.4.1.2c219ba
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/zyedidia/micro"
license=('MIT')
makedepends=('go' 'git')
optdepends=('xclip: Required for copying/pasting text')
conflicts=('micro-bin' 'micro' 'micro-nightly-bin')
provides=('micro')
source=("${pkgname}"::"git+https://github.com/zyedidia/micro.git")
md5sums=(SKIP)
pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git tag | sort -V | tail -1).$(git rev-parse --short HEAD)"
}
build(){
 cd "${srcdir}/${pkgname}"
 export GOPATH=${srcdir}/${pkgname}
 export GOBIN="$GOPATH/bin"
 ln -s cmd/micro/vendor/ src
 ln -s "${srcdir}/${pkgname}" src/github.com/zyedidia/micro 
 make
 make install
}
package(){
 install -Dm755 $srcdir/$pkgname/bin/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
