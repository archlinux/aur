# Maintainer: TheAifam5 <theaifam5@gmail.com>

_pkgname=bullet-train-oh-my-zsh-theme
pkgname=$_pkgname-git
pkgver=v0.0.5.r236.gd60f62c
pkgrel=1
pkgdesc='An oh-my-zsh shell theme based on the Powerline Vim plugin'
arch=('any')
url='https://github.com/caiogondim/bullet-train-oh-my-zsh-theme'
license=('MIT')
depends=('zsh' 'oh-my-zsh-git')
source=('git+https://github.com/caiogondim/bullet-train-oh-my-zsh-theme.git')
sha256sums=('SKIP')
makedepends=('git')
conflicts=('bullet-train-oh-my-zsh-theme' 'oh-my-zsh-bullet-train-theme')

pkgver() {
    cd "$_pkgname"
    (   
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$_pkgname"

    # We don't need anything related to git in the package
    rm -rf .git*

    # License is inside of README
    install -D -m644 README.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Install empty documentation
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    # Install the theme
    install -D -m644 bullet-train.zsh-theme "${pkgdir}/usr/share/oh-my-zsh/themes/bullet-train.zsh-theme"
}

# vim:set ts=4 sw=4 et:
