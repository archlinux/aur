# Maintainer: AntarcDev <kxantarc@tuta.io>

_theme_name=lonely
pkgname=plymouth-theme-lonely-git
pkgver=r4.71ede86
pkgrel=1
pkgdesc="A Plymouth theme with Evernight doing the lonely dance"
arch=('any')
url="https://github.com/AntarcDev/lonely"
license=('MIT')
depends=('plymouth')
makedepends=('git')
provides=("plymouth-theme-${_theme_name}")
conflicts=("plymouth-theme-${_theme_name}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/lonely"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # 1. Enter the source directory
    cd "${srcdir}/lonely"

    # cd "${_theme_name}"

    # 2. Create the destination directory
    install -d "${pkgdir}/usr/share/plymouth/themes/${_theme_name}"

    # 3. Install the theme files
    # We copy everything (*) excluding the .git folder
    cp -r ./* "${pkgdir}/usr/share/plymouth/themes/${_theme_name}"

    # 4. Clean up unnecessary files that might have been copied
    rm -f "${pkgdir}/usr/share/plymouth/themes/${_theme_name}/PKGBUILD"
    rm -f "${pkgdir}/usr/share/plymouth/themes/${_theme_name}/.gitignore"
}
