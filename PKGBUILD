# Maintainer: Hekuran https://github.com/narukeh

pkgname=sm64pc-git
pkgver=r71.b4626bf
pkgrel=1
pkgdesc='Super Mario 64-PC - OpenGL adaptation of n64decomp/sm64'
arch=('any')
url="https://github.com/sm64pc/sm64pc/"
license=('MIT')
depends=('python' 'audiofile' 'sdl2' 'glew')
provides=(sm64pc)

_gitname=sm64pc

source=("git+https://github.com/sm64pc/sm64pc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"
    cp ../../baserom.us.z64 . || printf "$(printf "%"$(stty size | awk '{print $2}')"s\n" | sed "s/ /░/g" && printf "\\n%s\\n%s\\n\\n" "US by default, if you want JP or EU, edit the PKGBUILD." "NO ROM FOUND\!: Copy your sm64 rom to \"src/sm64pc/\", if using 'yay' then \"~/.cache/yay/sm64pc/\". And then rename it as \"baserom.us.z64\" or \"baserom.jp.z64\" or \"baserom.eu.z64\"." && printf "%"$(stty size | awk '{print $2}')"s\n" | sed "s/ /░/g")"
}

build() {
    cd "$srcdir/$_gitname"
    make VERSION=us -j4
}

package() {
    cd "$srcdir/$_gitname/build/us_pc"
	install -Dm755 sm64.us* "${pkgdir}/usr/bin/sm64pc"
}
