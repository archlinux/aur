# Maintainer: habarnam <habarnam@littr.me>
pkgname=frequest-git
pkgver=v1.1.r3.1d67226
pkgrel=1
pkgdesc="A fast, lightweight and open-source desktop application to execute HTTP(s) requests"
arch=('x86' 'x86_64')
url="https://fabiobento512.github.io/FRequest/"
license=('GPL')
depends=('qt5-base>=5.10.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/fabiobento512/FRequest.git"
        'git+https://github.com/fabiobento512/CommonUtils.git'
        'git+https://github.com/fabiobento512/CommonLibs.git'
         "${pkgname%-git}.desktop")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '528da4abe728d414e6f8d8764dd26006')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

package() {
	cd "$pkgdir"
    mkdir -p usr/bin
    cp "$srcdir/${pkgname%-git}/FRequest" usr/bin/${pkgname%-git}
    mkdir -p usr/share/{applications,icons}
    cp "$srcdir/${pkgname%-git}/frequest_icon.png" "usr/share/icons/${pkgname%-git}.png"
    cp "$srcdir/frequest.desktop" "usr/share/applications/${pkgname%-git}.desktop"
}
