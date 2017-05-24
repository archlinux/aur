# Maintainer: B.C. van Zuiden <zuiden@ilorentz.org>
_pkgname=pallache
pkgname=${_pkgname}-git
pkgver=1.0
pkgrel=2
pkgdesc="A small and simple header only math parser library (with rlwrapped interface)"
arch=(any)
url="http://github.com/originalsouth/pallache"
license=('unknown')
makedepends=('git')
provides=('pallache')
source=('git://github.com/originalsouth/pallache.git')
md5sums=('SKIP')

build()
{
    make -C ${_pkgname}
}

package()
{
    mkdir -p "$pkgdir/usr/include/"
    install -m 655 ${_pkgname}/pallache.h "$pkgdir/usr/include/pallache.h"
    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 ${_pkgname}/pallache "$pkgdir/usr/bin/pallache-bin"
    printf '#!/usr/bin/env sh\nrlwrap /usr/bin/pallache-bin $@\nexit 0\n' > "${_pkgname}/pallache_wrap"
    install -m 755 ${_pkgname}/pallache_wrap "$pkgdir/usr/bin/pallache"
}
