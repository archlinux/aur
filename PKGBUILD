# Contributor: Daniel YC Lin <dlin (at) gmail>
# Maintainer: Daniel YC Lin <dlin.tw at gmail>

pkgname=vim-tabular-git
pkgver=r29.60f2564
pkgrel=1
pkgdesc="Vim script for text filtering and alignment"
arch=('any')
url="https://github.com/godlygeek/tabular"
license='custom:BSD 3-Clause'
makedepends=('git')
depends=('vim')
provides=('vim-tabular')
install=vim-plugin.install
source=('repo::git+https://github.com/godlygeek/tabular.git')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/repo"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
    cd $srcdir/repo

    install -dm755 $pkgdir/usr/share/vim/vimfiles/after/plugin
    install -dm755 $pkgdir/usr/share/vim/vimfiles/{autoload,doc,plugin}

    install -Dm644 after/plugin/*  $pkgdir/usr/share/vim/vimfiles/after/plugin/
    install -Dm644 autoload/* $pkgdir/usr/share/vim/vimfiles/autoload/
    install -Dm644 doc/*    $pkgdir/usr/share/vim/vimfiles/doc/
    install -Dm644 plugin/*            $pkgdir/usr/share/vim/vimfiles/plugin/

    sed -n '/License:/,/ DAMAGE/p' plugin/Tabular.vim > LICENSE

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
