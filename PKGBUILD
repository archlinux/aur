# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantshell
pkgname=$_pkgname
pkgver=20204208429760e
pkgrel=1
pkgdesc="zsh shell config for instantOS"
url="https://github.com/instantOS/instantSHELL"
arch=('any')
license=('MIT')
depends=('sh' 'zsh' 'bash')
makedepends=('git')
provides=(instantshell)
conflicts=(instantshell)
source=("$_pkgname::git+https://github.com/instantOS/instantshell.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    bash fetch.sh
    mkdir -p ${pkgdir}/usr/share/instantshell
    mkdir -p ${pkgdir}/usr/bin

    cat zshrc >>./ohmyzsh/templates/zshrc.zsh-template
    rm zshrc

    mkdir -p ./ohmyzsh/custom/plugins/instantos
    mv instantos.plugin.zsh ./ohmyzsh/custom/plugins/instantos/

    mkdir -p ./ohmyzsh/custom/themes
    mv instantos.zsh-theme ./ohmyzsh/custom/themes/

    chmod +x install.sh
    mv install.sh ${pkgdir}/usr/bin/instantshell

    mv ohmyzsh/* ${pkgdir}/usr/share/instantshell
}
