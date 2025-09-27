# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=nvm-fish
pkgver=1.2.0
pkgrel=1
pkgdesc="Fish shell wrapper for official nvm using bass - enables nvm commands in fish while preserving full compatibility with bash nvm installations"
arch=('any')
url="https://github.com/ChHsiching/nvm-fish-aur"
groups=('fish-plugins')
license=('MIT')
depends=('nvm' 'fish' 'git')
makedepends=()
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/ChHsiching/nvm-fish-aur.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"

    # Create fish functions directory
    install -d "${pkgdir}/usr/share/fish/vendor_functions.d/"

    # Install core fish function files
    install -m644 "core/nvm.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "core/nvm_find_nvmrc.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "core/load_nvm.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "core/bass_helper.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "core/nvm_utils.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"

    # Create bass local compilation directory (for cases without plugin manager)
    install -d "${pkgdir}/usr/share/nvm-fish/bass/functions"
}
