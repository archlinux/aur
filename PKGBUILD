# Maintainer: Pascal Mehnert <gargoil@posteo.de>

pkgname=nvimpager-git
pkgver=0.10.4.r18.g7a0b5dd
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.4.4' 'bash')
makedepends=('git' 'scdoc')
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
