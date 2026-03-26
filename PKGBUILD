# Maintainer: damachin3 (damachine3 at proton dot me)
# website: https://github.com/damachine/tkginstaller
pkgname=tkginstaller-git
pkgver=0.40.5
pkgrel=1
provides=('tkginstaller')
replaces=('tkginstaller')
conflicts=('tkginstaller')
pkgdesc="bash wrapper to build & install Frogging-Family stuff with ease"
arch=('x86_64')
url="https://github.com/damachine/tkginstaller"
license=('MIT')
depends=('git' 'onefetch')
optdepends=('bat: syntax highlighting'
            'curl: downloading files'
            'fzf: the interactive menu'
            'glow: markdown rendering'
            'nano: editing config files'
            'wdiff: comparing config files')
install=tkginstaller.install
source=("${pkgname}::git+https://github.com/damachine/tkginstaller.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s" "$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$srcdir/${pkgname}/tkginstaller" "$pkgdir/usr/bin/tkginstaller"
}
