# Maintainer: snogard <snogardb at gmail dot com>

_theme_name=clearos
url=https://github.com/PlayingKarrde/clearOS

pkgname=pegasus-frontend-theme-${_theme_name}-git
pkgver=1.1.r4.gc76f92c
pkgrel=1
pkgdesc="${_themeName} theme for pegasus frontend"
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

package(){
    install -dm755 ${pkgdir}/usr/share/pegasus-frontend/themes
    cp -r --no-preserve=mode,ownership "${srcdir}/${_theme_name}" "${pkgdir}/usr/share/pegasus-frontend/themes/${_theme_name}"
}
