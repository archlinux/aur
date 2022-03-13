# Maintainer: Phoney Badger <badgerphoney at gmail dot com>
pkgname=pokemon-colorscripts-git
_pkgname=pokemon-colorscripts
pkgver=r83.ae8a862
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
    mkdir -p "$pkgdir/usr/local/opt/$_pkgname/colorscripts/regular"
    mkdir -p "$pkgdir/usr/local/opt/$_pkgname/colorscripts/shiny"
    mkdir -p "$pkgdir/usr/local/bin"
    install -Dm644 colorscripts/regular/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/regular"
    install -Dm644 colorscripts/shiny/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/shiny"
    install -Dm644 nameslist.txt "$pkgdir/usr/local/opt/$_pkgname/nameslist.txt"
    install -Dm755 pokemon-colorscripts.sh "$pkgdir/usr/local/opt/$_pkgname/pokemon-colorscripts.sh"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 pokemon-colorscripts.1 "$pkgdir/usr/local/man/man1/pokemon-colorscripts.1"
    # creating symlink in usr/local/bin
    ln -sf "/usr/local/opt/$_pkgname/pokemon-colorscripts.sh" "$pkgdir/usr/local/bin/pokemon-colorscripts"
}

