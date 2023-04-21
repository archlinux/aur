# Maintainer: f4iey <f4iey@f6kgl.ampr.org>

pkgname=easymorse-git
pkgver=r38.b8748c3
pkgrel=2
pkgdesc="Simple crossplatform tool to learn morse code or automatic traffic on CW"
arch=(x86_64)
url="https://bitbucket.org/Artemia/easymorse"
license=(GPL3)
depends=(qt6-base qt6-multimedia qt6-serialport)
makedepends=(git qt6-tools)
provides=(easymorse)
conflicts=(easymorse)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/easymorse"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "$srcdir/easymorse"
    qmake6 CONFIG+=release
    make
}

package() {
    cd "$srcdir/easymorse"
    make install INSTALL_ROOT="${pkgdir}/"
    rm -r "$pkgdir/opt"

    #bug: translation is not installed but happen running makepkg twice without cleaning the cache
    install -D translations/* -t "${pkgdir}/usr/share/easymorse/translations/"
}
