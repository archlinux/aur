# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: totoloco <totoloco@ushcompu.com.ar>

pkgname=covergloobus
pkgver=1.6
pkgrel=2
pkgdesc="A standalone application to see what is playing in your favourite music player"
arch=(any)
url=https://launchpad.net/$pkgname
license=(GPL3)
depends=(dbus-python python pygtk ttf-liberation)
makedepends=(intltool gettext)
source=($url/$pkgver/${pkgver}stable/+download/${pkgname}_$pkgver.tar.gz)
sha256sums=('45757df4dc6188586797480eb8c077d2b9e461945d4e38e0a39b21a5c7762ee9')
sha512sums=('d6fdf3cee7d2ead06cc045737a9eaa53cc6dff1ab227f6ed91367aa30903125ddecacbcfd0ed114cfde6de54b8a41d365c3fe25cd5137218e9f7ccba5d05b6fc')

build() {
    cd $pkgname-$pkgver/
    export PYTHON=python2
    find -type f -exec sed -ri \
        -e 's:python\b:&2:' \
        -e 's:AM_PROG_MKDIR_P:AC_PROG_MKDIR_P:g' '{}' \;
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

