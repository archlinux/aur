# Maintainer: yubimusubi

# From README:
# Currently supports the following portlibs:
#
# freetype (requires zlib)
# jansson
# libexif
# libjpeg-turbo
# libpng (requires zlib)
# libxmp-lite
# sqlite
# tinyxml2
# zlib

_pkgbase=devkitarm-portlibs
pkgbase=${_pkgbase}-git
pkgname=(
    "${_pkgbase}-zlib-git"
    "${_pkgbase}-freetype-git"
    "${_pkgbase}-jansson-git"
    "${_pkgbase}-libexif-git"
    "${_pkgbase}-libjpeg-turbo-git"
    "${_pkgbase}-libpng-git"
    "${_pkgbase}-libxmp-lite-git"
    "${_pkgbase}-sqlite-git"
    "${_pkgbase}-tinyxml2-git"

    "${_pkgbase}-git" # Meta-package depends on all targets
)

pkgver=r41.5751bcd
pkgrel=1
pkgdesc='devkitarm portlibs libraries (for Nintendo 3DS homebrew development)'
arch=('any')
url='https://github.com/devkitPro/3ds_portlibs'
license=('zlib')
options=(!strip staticlibs)
depends=('devkitarm')
makedepends=('git' 'curl')
source=("$_pkgbase::git+https://github.com/devkitPro/3ds_portlibs.git")
sha256sums=('SKIP')

_clean_and_install() {
    _target=$1
    cd "$_pkgbase"
    source /etc/profile.d/devkitarm.sh

    make clean # Remove any prior built targets

    # The default "DOWNLOAD" command in the Makefile doesn't follow redirects
    make DOWNLOAD='curl -L -o "$(1)" "$(2)"' $_target
    make DESTDIR="$pkgdir" install
}

pkgver() {
    cd "$_pkgbase"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package_devkitarm-portlibs-zlib-git() {
    provides=('devkitarm-portlibs-zlib')
    pkgdesc='Deflate compression method library (for Nintendo 3DS homebrew development)'
    cd "$_pkgbase"
    source /etc/profile.d/devkitarm.sh

    make clean # Remove any prior built targets

    # The default "DOWNLOAD" command in the Makefile doesn't follow redirects
    make DOWNLOAD='curl -L -o "$(1)" "$(2)"' zlib
    make DESTDIR="$pkgdir" install-zlib
}

package_devkitarm-portlibs-libjpeg-turbo-git() {
    provides=('devkitarm-portlibs-libjpeg-turbo')
    pkgdesc='JPEG library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'libjpeg-turbo'
}

package_devkitarm-portlibs-libpng-git() {
    provides=('devkitarm-portlibs-libpng')
    depends=('devkitarm-portlibs-zlib')
    pkgdesc='PNG library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'libpng'
}

package_devkitarm-portlibs-freetype-git() {
    provides=('devkitarm-portlibs-freetype')
    depends=('devkitarm-portlibs-zlib')
    pkgdesc='freetype library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'freetype'
}

package_devkitarm-portlibs-jansson-git() {
    provides=('devkitarm-portlibs-jansson')
    pkgdesc='jansson library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'jansson'
}

package_devkitarm-portlibs-libexif-git() {
    provides=('devkitarm-portlibs-libexif')
    pkgdesc='exif library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'libexif'
}

package_devkitarm-portlibs-libxmp-lite-git() {
    provides=('devkitarm-portlibs-libxmp-lite')
    pkgdesc='XMP library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'libxmp-lite'
}

package_devkitarm-portlibs-sqlite-git() {
    provides=('devkitarm-portlibs-sqlite')
    pkgdesc='SQL library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'sqlite'
}

package_devkitarm-portlibs-tinyxml2-git(){
    provides=('devkitarm-portlibs-tinyxml2')
    pkgdesc='XML library (for Nintendo 3DS homebrew development)'

    _clean_and_install 'tinyxml2'
}

package_devkitarm-portlibs-git(){
    provides=('devkitarm-portlibs')
    depends=(
        "${_pkgbase}-zlib-git"
        "${_pkgbase}-freetype-git"
        "${_pkgbase}-jansson-git"
        "${_pkgbase}-libexif-git"
        "${_pkgbase}-libjpeg-turbo-git"
        "${_pkgbase}-libpng-git"
        "${_pkgbase}-libxmp-lite-git"
        "${_pkgbase}-sqlite-git"
        "${_pkgbase}-tinyxml2-git"
    )
}
