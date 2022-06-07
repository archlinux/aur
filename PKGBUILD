# Maintainer: Jef Roosens

pkgbase='vasteroids-git'
pkgname='vasteroids-git'
pkgver=r17.c7fdeee
pkgrel=1
pkgdesc='Clone of the Asteroids game written in V (Development version)'
arch=('x86_64')

url='https://github.com/islonely/vasteroids'

depends=('glibc' 'libx11' 'libglvnd' 'libxcursor' 'libxi' 'libxcb' 'libxrender'
    'libxfixes' 'libxext' 'libxau' 'libxdmcp')
makedepends=('git' 'vlang-git')

source=("${pkgname}::git+https://github.com/islonely/vasteroids#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    commit_count="$(git rev-list --count HEAD)"
    commit="$(git rev-parse --short HEAD)"

    echo "r${commit_count}.${commit}"
}

build() {
    cd "${pkgname}"

    v -prod -o vasteroids .
}

package() {
    install -Dm755 "${pkgname}/vasteroids" -t "${pkgdir}/usr/bin"
}
