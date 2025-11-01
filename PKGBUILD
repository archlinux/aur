gitname=fbpanel
pkgname="$gitname-git"
pkgver=102.bc8bcfe
pkgrel=1
pkgdesc="NetWM compliant desktop panel (git)"
license=(GPL)
arch=(i686 x86_64)
provides=('fbpanel' 'fbpanel-svn')
conflicts=('fbpanel' 'fbpanel-svn')
depends=('gtk2' 'python2')
makedepends=('automake' 'autoconf')
url="https://github.com/akozlins/$gitname"
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"

    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}

build(){
    cd "${srcdir}/${gitname}"

    cmake -B builddir -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build builddir
}

package(){
    cd "${srcdir}/${gitname}"

    DESTDIR="$pkgdir" cmake --install builddir
}
