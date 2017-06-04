# Maintainer: Reto Brunner <brunnre8@gmail.com>
pkgname=gonvim-git
pkgver=r97.6f278c2
pkgrel=1
pkgdesc="Neovim GUI written in Golang"
arch=('any')
url="https://github.com/dzhou121/gonvim"
license=('unknown')
depends=('neovim')
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
#install=
source=('git+https://github.com/dzhou121/gonvim#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${pkgname%-git}
    GOPATH="$srcdir" TMPDIR=/tmp go get -u -v github.com/dzhou121/${pkgname%-git}/...
}

package() {
    cd ${pkgname%-git}
	install -Dm 755 "$srcdir/bin/${pkgname%-git}" -t "$pkgdir/usr/bin/"
}
