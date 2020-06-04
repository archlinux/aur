# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alusus
pkgver=0.6.1
pkgrel=0
pkgdesc="ALUSUS PROGRAMMING LANGUAGE - لغة الأسس البرمجية"
arch=('x86_64')
url="https://alusus.org/"
license=('custom')
depends=('python' 'python-pip')
source=('https://github.com/sulimanp/Alusus/archive/master.zip')
md5sums=('aece76ac530dafcd5561bd354d46ae05')

build() {
    cd "$srcdir/Alusus-master"
    ./Tools/build.sh --bloc . --iloc .
if [ -e "./Builds/Dependencies/llvm-10.0.0.install" ]; then
    cmake Sources -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX="$pkgdir/opt/Alusus" -DLLVM_PATH=./Builds/Dependencies/llvm-10.0.0.install
    make -j $(nproc)
fi
}

package() {
    cd "$srcdir/Alusus-master" 
    make install -j $(nproc)
}

# ==> ERROR: One or more files did not pass the validity check!
# makepkg -g >> PKGBUILD