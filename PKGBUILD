# Maintainer: Giuliano Schneider <gs93@gmx.net>
pkgname=pakbak-git
_gitname=pakbak
pkgver=0.0.0
pkgrel=3
pkgdesc="Back up the local pacman database when it changes"
arch=('any')
url="https://github.com/gs93/pakbak"
license=('GPL3')
depends=('bash' 'findutils' 'tar' 'systemd')
makedepends=('git')
backup=('etc/pakbak.conf')
source=("pakbak::git+https://github.com/gs93/$_gitname.git" $_gitname.install)
install=$_gitname.install
md5sums=('SKIP' '1a95c99da95f6ef360020a052ea651d6')
sha512sums=('SKIP' 'a9c216f1866d912dcd6a622f9b22bd45b20968fdb72cc64fe1f0184e95fba36ab3152103f12d66c6b047599bd4ec26b3a6a51ed58eb1da1322f28223f625ad1c')

pkgver() {
    # using the last commit date
    cd "$_gitname"
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd "$_gitname"

    mkdir -p "$pkgdir/usr/lib/systemd/scripts"
    install -Dm755 pakbak_script "$pkgdir/usr/lib/systemd/scripts/pakbak"

    mkdir -p "$pkgdir/etc"
    install -Dm644 pakbak.conf "$pkgdir/etc/pakbak.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -Dm644 pakbak.service "$pkgdir/usr/lib/systemd/system/pakbak.service"
    install -Dm644 pakbak.path "$pkgdir/usr/lib/systemd/system/pakbak.path"
}
