# Maintainer: Pascal Mehnert <pascalmehnert@posteo.de>

pkgname=nvimpager-git
pkgver=0.13.0.r6.g99c273c
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.9.0' 'bash')
makedepends=('git' 'scdoc')
checkdepends=('busted' 'procps-ng')
conflicts=('nvimpager')
provides=('nvimpager')
source=('git+https://github.com/lucc/nvimpager.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd nvimpager/
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd nvimpager/

    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vimpager/LICENSE"
}

check() {
    cd nvimpager/
    make test BUSTED='busted --exclude-tags=v10'
}
