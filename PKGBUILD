# Maintainer: f4iey <f4iey@f6kgl.ampr.org>

pkgname=easymorse
pkgver=r37.601035b
pkgrel=1
pkgdesc="Simple crossplatform tool to learn morse code or automatic traffic on CW (Qt5 version)"
arch=(x86_64)
url="https://bitbucket.org/Artemia/easymorse"
license=(GPL3)
depends=(qt5-base qt5-multimedia qt5-serialport)
makedepends=(git qt5-tools)
source=("git+$url.git#commit=601035b710487f34eeb5ab4e7ee9dbfd44ae8a5f")
sha256sums=('SKIP')
#fallback to qt5 version

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "$srcdir/$pkgname"
    qmake CONFIG+=release
    make
}

package() {
    cd $srcdir/$pkgname
    make install INSTALL_ROOT="${pkgdir}/"
    rm -r "$pkgdir/opt"

    #bug: translation is not installed but happen running makepkg twice without cleaning the cache
    install -D translations/* -t "${pkgdir}/usr/share/easymorse/translations/"
}

