# Creator: Phoney Badger <phoneybadgercode.4ikc7 at simplelogin.co>
# Maintainer: AnarchistHoneybun <thatonebipanda@gmail.com>
pkgname=pokemon-colorscripts-fork-git
_pkgname=pokemon-colorscripts-fork
pkgver=r117.742672d
pkgrel=1
pkgdesc="CLI utility that prints unicode sprites of pokemon to the terminal"
arch=('any')
url="https://github.com/AnarchistHoneybun/pokemon-colorscripts-fork"
license=('MIT')
depends=('coreutils' 'python')
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
    install -Dm644 colorscripts/small/regular/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/small/regular"
    install -Dm644 colorscripts/small/shiny/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/small/shiny"
    install -Dm644 colorscripts/large/regular/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/large/regular"
    install -Dm644 colorscripts/large/shiny/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/large/shiny"
    install -Dm644 pokemon.json "$pkgdir/usr/local/opt/$_pkgname/pokemon.json"
    install -Dm755 pokemon-colorscripts.py "$pkgdir/usr/local/opt/$_pkgname/pokemon-colorscripts.py"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 pokemon-colorscripts.1 "$pkgdir/usr/local/man/man1/pokemon-colorscripts.1"
    # creating symlink in usr/local/bin
    ln -sf "/usr/local/opt/$_pkgname/pokemon-colorscripts.py" "$pkgdir/usr/local/bin/pokemon-colorscripts"
}
