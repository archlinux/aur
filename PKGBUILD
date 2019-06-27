# Maintainer: Holger Obermaier
pkgname="password-gorilla"
_realpkgname="gorilla"
pkgver="1.5.3.7"
pkgrel=7
pkgdesc="A cross-platform password manager."
arch=('x86_64')
url="https://github.com/zdia/gorilla/wiki/"
license=('GPL2')
depends=(
    'glibc'
    'hicolor-icon-theme'
)
source=(
    "http://gorilla.dp100.com/downloads/${_realpkgname}1537_64.bin"
    "http://gorilla.dp100.com/downloads/${_realpkgname}-1.5.3.7.zip"
)
sha256sums=(
    '19f4cfa9f76a04d6c5427b0049f8e2d5833367676b71d12f2c0205c0483739a6'
    '747483e3d9cc7dfac48be0445c5f606e8d18a01dd91edbcee9d361c39bfec951'
)
options=( '!strip' )

package() {
    # target directory structur
    local bin_dir="${pkgdir}/usr/bin"
    local icon_dir="${pkgdir}/usr/share/icons/hicolor"
    local icon48x48_dir="${icon_dir}/48x48/apps"
    local icon32x32_dir="${icon_dir}/32x32/apps"
    local icon16x16_dir="${icon_dir}/16x16/apps"
    local pixmaps_dir="${pkgdir}/usr/share/pixmaps"
    local desktop_dir="${pkgdir}/usr/share/applications"
    local menu_dir="${pkgdir}/usr/share/menu"
    local man_dir="${pkgdir}/usr/share/man/man1"

    # source directory structure
    local srcdir_deb="${srcdir}/${_realpkgname}-${pkgver}/utilities/make-deb.data"

    # binary
    install -D --preserve-timestamps --verbose --mode=u=rwx,go=rx "${srcdir}/gorilla1537_64.bin" "${bin_dir}/password-gorilla"

    # icons
    install -D --preserve-timestamps --verbose "${srcdir_deb}/16x16.password-gorilla.png" "${icon16x16_dir}/password-gorilla.png"
    install -D --preserve-timestamps --verbose "${srcdir_deb}/32x32.password-gorilla.png" "${icon32x32_dir}/password-gorilla.png"
    install -D --preserve-timestamps --verbose "${srcdir_deb}/48x48.password-gorilla.png" "${icon48x48_dir}/password-gorilla.png"
    install -D --preserve-timestamps --verbose "${srcdir_deb}/password-gorilla.xpm" "${pixmaps_dir}/password-gorilla.xpm"

    # desktop file
    install -D --preserve-timestamps --verbose "${srcdir_deb}/password-gorilla.desktop" "${desktop_dir}/password-gorilla.desktop"

    # menu file
    install -D --preserve-timestamps --verbose "${srcdir_deb}/password-gorilla.menu" "${menu_dir}/password-gorilla.menu"

    # man file
    install -D --preserve-timestamps --verbose "${srcdir_deb}/password-gorilla.1" "${man_dir}/password-gorilla.1"
}
