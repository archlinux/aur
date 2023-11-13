# Maintainer: snogard <snogardb at gmail dot com>

_theme_name=shinretro
url=https://github.com/TigraTT-Driver/shinretro

pkgname=pegasus-frontend-theme-${_theme_name}-git
pkgver=v0.201.r24.g6718e74
pkgrel=1
pkgdesc="theme for pegasus frontend"
arch=(any)
license=(GPL3)
depends=(pegasus-frontend)
makedepends=(git)
source=("${_theme_name}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_theme_name}"
    if $(git describe --long --tags > /dev/null ) ; then
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build()
{
    rm -r ${srcdir}/${_theme_name}/.git
}

package(){
    install -dm755 ${pkgdir}/usr/share/pegasus-frontend/themes
    cp -r --no-preserve=mode,ownership "${srcdir}/${_theme_name}" "${pkgdir}/usr/share/pegasus-frontend/themes/${_theme_name}"
}
