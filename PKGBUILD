# Maintainer: zhanghua <zhanghua.00@qq.com>
# Contributor: killf <killf@foxmail.com>

pkgname=cgit-vcs-git
pkgver=1.1.0
pkgrel=2
pkgdesc="A fast github clone tool in China"
arch=('x86_64' 'i686' 'aarch64')
url='https://gitee.com/killf/cgit'
license=('MIT')
depends=('git')
makedepends=('cmake')
provides=('cgit-vcs')
conflicts=('cgit-vcs')
source=("git+${url}")
sha256sums=('SKIP')
pkgver(){
    cd "${srcdir}/cgit"
    git describe --tags | sed "s/-/_/g;s/v//"
}
prepare(){
    mkdir -p "${srcdir}/cgit/build"
    cd "${srcdir}/cgit/build"
    cmake --install-prefix=/usr ..
}
build(){
    cd "${srcdir}/cgit/build"
    make
}
package(){
    cd "${srcdir}/cgit/build"
    make DESTDIR="${pkgdir}" install
}
