pkgname=aurutils-git
pkgver=r325.2218881
pkgrel=1
pkgdesc='AUR helpers tools'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("git+$url")
md5sums=('SKIP')
depends=('pacman>=5.0' 'git' 'repose-git' 'jshon' 'pacutils-git' 'expac' 'aria2' 'moreutils')
makedepends=('git')
optdepends=('devtools: aurbuild -c'
	    'setconf: aurbuild -R'
	    'vifm: better interaction with source files')
           
pkgver() {
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd aurutils
    install -d "$pkgdir"/usr/{bin,share{/licenses,/doc}/aurutils}

    install -m755 ./aur* repofind -t "$pkgdir"/usr/bin
    install -m644 LICENSE -t "$pkgdir"/usr/share/licenses/aurutils
    install -m644 CREDITS README.md -t "$pkgdir"/usr/share/doc/aurutils
}

