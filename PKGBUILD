# Maintainer: revel <revelΘmuub·net>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=falcon
pkgver=0.9.6.8
pkgrel=4
pkgdesc='a general purpose untyped language, based on a Virtual Machine executing portable pseudo codes'
arch=('i686' 'x86_64')
url='http://falconpl.org'
license=('GPL2'
         'custom:FPLLv1.1')
depends=('bison' 'gtk2' 'gd' 'curl' 'dbus' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'sqlite' 'libmysqlclient' 'postgresql-libs')
makedepends=('cmake')
source=("http://falconpl.org/project_dl/_official_rel/Falcon-$pkgver.tgz"
#        'mongodb-module.patch'
        )
md5sums=('8435f6f2fe95097ac2fbe000da97c242')
sha256sums=('f4b00983e7f91a806675d906afd2d51dcee048f12ad3af4b1dadd92059fa44b9')

prepare() {
    cd "Falcon-$pkgver"
#    patch -p1 -i ../mongodb-module.patch
}

build() {
    cd "Falcon-$pkgver"
    [ -d build ] || mkdir build
    cd build

    # mongodb module disabled due to compilation problems
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DFALCON_BUILD_MONGODB=Off

    make
}

package() {
    cd "Falcon-$pkgver/build"
    make install DESTDIR="$pkgdir/"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/falcon/LICENSE"
}
