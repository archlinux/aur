gitname=fbpanel
pkgname=$gitname-git
pkgver=44.478754b
pkgrel=1
pkgdesc="NetWM compliant desktop panel (git)"
license=GPL
arch=(i686 x86_64)
provides=(fbpanel fbpanel-svn)
conflicts=(fbpanel fbpanel-svn)
depends=(gtk2 python)
makedepends=(automake autoconf)
url=https://github.com/aanatoly/$gitname
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}

build(){
    cd "${srcdir}/${gitname}"
    ./configure --prefix=/usr
    echo "LDFLAGSX += -lX11 -lm" >>config.mk
    ionice -c 3 nice -n 19 make
}
package(){
    cd "${srcdir}/${gitname}"
    make DESTDIR="$pkgdir/" install
}
