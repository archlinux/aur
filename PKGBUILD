# Maintainer: Viktor Nagy <viktor.nagy1995@gmail.com>
pkgname=lsx-git
pkgver=1
pkgrel=2
pkgdesc="Navigate through terminal like a pro"
arch=('x86_64')
url="https://github.com/souvikinator/lsx"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=()
provides=("lsx")
source=('lsx-git::git://github.com/souvikinator/lsx.git')

sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "${srcdir}/${pkgname}"
    export GOPATH="${srcdir}"
    export PATH="${PATH}:${GOPATH}/bin"

    chmod +x install.sh

    # runs
    # go build -o "$GOPATH/bin/ls-x"
    ./install.sh
}

package () {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "${srcdir}/bin/ls-x" "${pkgdir}/usr/bin/ls-x"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    echo "Now you need to source in your .bashrc/.zshrc"
    echo "source ~/.config/lsx/lsx.sh"
    echo "For more info:"
    echo "https://github.com/souvikinator/lsx#step-2"
}
