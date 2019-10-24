# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Co-maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker
pkgver=2.1.4
pkgrel=1
pkgdesc="The new cmsMake!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/algorithm-ninja/task-maker"
license=('MPL2')
depends=('python' 'python-ruamel-yaml' 'python-traits' 'capnproto' 'pybind11')
makedepends=('cmake' 'gmock' 'gtest' 'python-pip')
source=("https://github.com/algorithm-ninja/task-maker/archive/v${pkgver}.tar.gz")
sha384sums=('f242df9fc03b9878f6ff3d7fbfa259364de50c32071a4703962532210964b51df301a33553bf9ca7cc2a350e6dbd15f1')

build() {
    cd "$srcdir/task-maker-${pkgver}"
    rm -rf build && mkdir -p build
    cd build
    cmake -DHUNTER_ENABLED=OFF -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/task-maker-${pkgver}/build/python"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 ../tools/autocomp/zsh/_task_maker "$pkgdir/usr/share/zsh/site-functions/_task_maker"
    install -Dm644 ../tools/autocomp/zsh/_contest_maker "$pkgdir/usr/share/zsh/site-functions/_contest_maker"
    install -Dm644 ../tools/autocomp/bash/task-maker "$pkgdir/usr/share/bash-completion/completions/task-maker"
    install -Dm644 ../tools/autocomp/bash/contest-maker "$pkgdir/usr/share/bash-completion/completions/contest-maker"
}
