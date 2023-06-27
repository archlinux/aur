# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurutils-git
pkgver=17.r0.gdc9dd2ce
pkgrel=1
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
source=('git+https://github.com/AladW/aurutils')
changelog=aurutils.changelog
sha256sums=('SKIP')
conflicts=('aurutils')
provides=("aurutils=${pkgver%%.r*}")
depends=('git' 'pacutils' 'curl' 'bash' 'perl' 'perl-json-xs')
makedepends=('git')
optdepends=('bash-completion: bash completion'
            'zsh: zsh completion'
            'devtools: aur-chroot'
            'vifm: default pager'
            'ninja: aur-sync ninja support'
            'bat: view-delta example script'
            'git-delta: view-delta example script'
            'python-srcinfo: sync-rebuild example script')

pkgver() {
    cd aurutils
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd aurutils
    make
}

package() {
    cd aurutils
    make DESTDIR="$pkgdir" install
}
