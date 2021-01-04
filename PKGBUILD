# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>
pkgname=polkit-dumb-agent-git
pkgver=r22.c6424b6
pkgrel=1
pkgdesc="A polkit agent in 145 lines of code using Qt and libsystemd, because polkit sucks."
arch=(i686 x86_64)
url="https://github.com/sandsmark/polkit-dumb-agent"
license=(GPL3)
depends=(qt5-base kdesu systemd)
makedepends=(git cmake)
provides=(polkit-dumb-agent)
conflicts=(polkit-dumb-agent)
source=('git+https://github.com/sandsmark/polkit-dumb-agent.git')
md5sums=('SKIP')

pkgver() {
    cd polkit-dumb-agent
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
        cmake ../polkit-dumb-agent \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
