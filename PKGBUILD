# Maintainer: beelzy
pkgname=rstmcpp-git
pkgver=1640486611.536830f
pkgrel=1
pkgdesc="A tool that converts wav files to .bcstm or .bcwav"
arch=('i686' 'x86_64')
url="https://gitlab.com/beelzy/rstmcpp"
license=('ISC')
sha256sums=('SKIP' 'SKIP')
depends=('gcc-libs')
makedepends=('git')

_gitroot='https://gitlab.com/beelzy/rstmcpp.git'
_gitname='rstmcpp'

source=("${_gitname}::git+${_gitroot}"
    "gc-dspadpcm-encode::git+https://github.com/jackoalan/gc-dspadpcm-encode.git")

prepare() {
    cd "$srcdir/$_gitname"
    git submodule--helper init
    git config submodule.gc-dspadpcm-encode.url "$srcdir/gc-dspadpcm-encode"
    git submodule--helper update
}

pkgver() {
    cd "$srcdir/$_gitname"
    git log --pretty=format:"%ad.%h" --date=format:"%s" -1
}

build() {
	cd "$srcdir/$_gitname"
    make BUILD_FLAGS="$LDFLAGS"
}

package() {
	install -D "$srcdir/$_gitname/rstmcpp" "$pkgdir/usr/bin/rstmcpp"
    install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
