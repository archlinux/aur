# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>
pkgname=aur-sleuth-git
pkgver=r121.e998ab2
pkgrel=1
pkgdesc='LLM-powered security auditor for AUR packages'
arch=('any')
url='https://github.com/mgalgs/aur-sleuth'
license=('MIT')
depends=('python' 'python-openai' 'python-rich' 'python-requests' 'git' 'pacman')
optdepends=('cabextract: support for packages that use cabinet archives')
makedepends=('git')
provides=('aur-sleuth')
conflicts=('aur-sleuth')
source=('git+https://github.com/mgalgs/aur-sleuth.git'
        'LICENSE')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd aur-sleuth
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd aur-sleuth
    sed -i '1s|.*|#!/usr/bin/python|' aur-sleuth
    install -Dm755 aur-sleuth "$pkgdir/usr/bin/aur-sleuth"
    cd ..
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
