# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.7.0
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner')
makedepends=('extra-cmake-modules' 'git' 'kcmutils')
install=$pkgname.install
#source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/JetBrainsRunnerWithSubmodule.tar.gz")
source=("$pkgname::git+$url#tag=$pkgver"
        "git+https://github.com/alex1701c/jetbrains-api")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd $pkgname
    git submodule init
    git config submodule.jetbrains-api.url "$srcdir/jetbrains-api"
    git submodule update
}

build() {
    cd $pkgname
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd $pkgname
    make -C build DESTDIR="$pkgdir" install
}
