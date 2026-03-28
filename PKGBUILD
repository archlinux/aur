# Maintainer: Europrimus <aur-g4gra@c-f.me>
# Cpontributor: jmcb <joelsgp@protonmail.com>

pkgname='blender-plugin-supertuxkart-git'
_git_commit=2dedf36
pkgver=r137.$_git_commit
pkgrel=2
pkgdesc="Custom scripts made to help in the creation of custom SuperTuxKart karts and tracks."
arch=('any')
url="https://github.com/supertuxkart/stk-blender"
license=('MIT')
depends=('blender'
         'supertuxkart')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}"
          'stk-blender')
conflicts=()
source=(
    "${pkgname}::git+https://github.com/supertuxkart/stk-blender.git#commit=${_git_commit}"
    "create_link.install"
    )
sha256sums=('7413bb7c4a7b3ccba5e0e08a2d9fc6ff36c5b9a35ee84e57ef261973ea645181'
            '6fb129493e72fec56332c14d88d14fcdae77c3b3957ed3ac84a3cdb76aae088e')
install="create_link.install"


pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    _dest="${pkgdir}/usr/share/blender/common/scripts/addons"

    cd "${srcdir}/$pkgname/io_scene_spm"
    find . -type f -exec install -D -m644 {} "${_dest}/io_spm_format/{}" \;

    cd "${srcdir}/$pkgname/io_antarctica_scene"
    find . -type f -exec install -D -m644 {} "${_dest}/io_STK_exporter_tools/{}" \;
}
