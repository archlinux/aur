# Maintainer: Henry Malinowski <malinowski.henry at gmail dot com>
# derived from PKGBUILD for zsh-notify and vim-youcompleteme-git
_name='zsh-dircolors-solarized'
pkgname="${_name}-git"
pkgver=r17.2d41598
pkgrel=1
pkgdesc='Solarized dircolors plugin for zsh'
url='https://github.com/joel-porquet/zsh-dircolors-solarized'
arch=('any')
license=('unknown')
depends=('zsh>=4.3.9')
makedepends=('git')
provides=('zsh-dircolors-solarized')
conflicts=('zsh-dircolors-solarized')
install="${_name}.install"
source=(
    "${_name}::${url//https/git}"
    'git+https://github.com/seebi/dircolors-solarized.git'
)

sha256sums=('SKIP' 'SKIP')

prepare() {
    # copy dircolors-solarized git into zsh-dircolors-solarized/dircolors-solarized
    cd "${srcdir}/${_name}"
    git submodule init
    git submodule update
}

package() {
    cd "${srcdir}/${_name}"

    # remove uneeded files from dircolors-solarized
    rm -r "dircolors-solarized/img/"
    rm "dircolors-solarized/test-directory.tar.bz2"

    # package and install
    install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"   
    cp --archive --no-preserve=ownership * "${pkgdir}/usr/share/zsh/plugins/${_name}"
}
