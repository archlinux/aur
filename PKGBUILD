# Maintainer: Phoney Badger <badgerphoney at gmail dot com>
pkgname=pokemon-colorscripts-git
_pkgname=pokemon-colorscripts
pkgver=r54.356ccaa
pkgrel=1
pkgdesc="CLI utility that prints unicode sprites of pokemon to the terminal"
arch=('any')
url="https://gitlab.com/phoneybadger/pokemon-colorscripts.git"
license=('MIT')
depends=('coreutils')
makedepends=('git')
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver(){
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
    # Creating necessary directories and copying files
    rm -rf "$pkgdir/usr/local/opt/$_pkgname"
    mkdir -p "$pkgdir/usr/local/opt/$_pkgname/colorscripts"
    mkdir -p "$pkgdir/usr/local/bin"
    install -Dm644 colorscripts/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts"
    install -Dm644 nameslist.txt "$pkgdir/usr/local/opt/$_pkgname/nameslist.txt"
    install -Dm755 pokemon-colorscripts.sh "$pkgdir/usr/local/opt/$_pkgname/pokemon-colorscripts.sh"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    # creating symlink in usr/local/bin
    ln -sf "/usr/local/opt/$_pkgname/pokemon-colorscripts.sh" "$pkgdir/usr/local/bin/pokemon-colorscripts"
}
