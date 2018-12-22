# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Co-maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker
pkgver=2.0.0
pkgrel=1
pkgdesc="The new cmsMake!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/algorithm-ninja/task-maker"
license=('MPL2')
depends=('python' 'python-ruamel-yaml' 'python-traits' 'capnproto' 'pybind11')
makedepends=('cmake' 'gmock' 'gtest' 'python-pip')
source=("https://github.com/algorithm-ninja/task-maker/archive/v${pkgver}.tar.gz")
sha384sums=('ecbc49386c9875ccb234380dbfcec3b787a3e75e1746d88bc7ad98a6dbec894d996b3d6bee7bbd7d4d024a93703ebbd4')

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
