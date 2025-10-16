# Maintainer: Europrimus <aur-g4gra@c-f.me>

pkgname=nqc-git
pkgver=v4.1.0.r7.gd886155
pkgrel=1
pkgdesc="Not Quite C is a simple language with a C-like syntax that can be used to program LEGO’s RCX programmable brick (from the MindStorms set). [from github source]"
arch=('i686' 'x86_64')
url='https://brickbot.github.io/nqc/'
license=('custom:MPL')
install="udevrules.install"
makedepends=('bison' 'git')
_commit=d886155906ecf5ee3a4b467e80c734fda0381f80
_local_src="${pkgname}-commit_${_commit}"
source=("${_local_src}::git+https://github.com/BrickBot/nqc.git#commit=${_commit}")
sha512sums=('5d82ce31897ac9d60c2239160417d657b381e5c970f5c2ef56f105120ba0bc2c1e3e9d78f0d8e0399b63d594b318b9e95ae5f5988807354713f988351227fb9d')


pkgver() {
  cd "${_local_src}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_local_src}"
    make clean
    make all
}

check() {
    cd "${_local_src}"
    local cmd="build/bin/nqc test.nqc"
    echo "testing nqc build: $cmd"
    $cmd
}

package() {
    # install binary
    install -D "${srcdir}/${_local_src}/build/bin/nqc" "${pkgdir}/usr/bin/${pkgname}_${pkgver}"
}
