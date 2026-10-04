#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgver="0.9"
pkgrel="1"
_name="notebook"
pkgname="$_name"
pkgdesc='Markdown Desktop Wiki'
url='https://codeberg.org/tuxnix/notebook'
arch=('any')
license=('GPL-2.0-only')
backup=('etc/notebook.conf' 'etc/$notebook.conf.py')
depends=('pandoc' 'python')
optdepends=(
    'retext: Markdown-Editor for writing notebooks'
    'python-pyenchant: Spell checking for ReText'
    'aspell-en: English dictionary'
    'aspell-de: German dictionary'
    'python-pyqt6-webengine: Web engine for ReText'
    'python-flask: For serving sides from browser to editor'
    'nodejs: JavaScript-functions browser like search'
)
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/notebook')
sha512sums=('SKIP')
install="$_name.install"

package() {
    cd "$srcdir/$_name"
    install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 "${_name}.conf.py" "$pkgdir/etc/${_name}.conf.py"
    install -Dm644 "${_name}.conf" "$pkgdir/etc/${_name}.conf"
    install -Dm644 "${_name}.service" "$pkgdir/usr/lib/systemd/system/${_name}.service"
    install -Dm644 "${_name}-watcher.service" "$pkgdir/usr/lib/systemd/system/${_name}-watcher.service"
    install -Dm644 "retext.service" "$pkgdir/usr/lib/systemd/system/retext.service"
    install -Dm644 "${_name}_server.py" "$pkgdir/usr/share/$_name/${_name}_server.py"
    # install -Dm644 "retext.js" "$pkgdir/usr/share/$_name/retext.js"
    install -Dm644 "tamplate.html" "$pkgdir/usr/share/$_name/tamplate.html"
    install -Dm644 "rename-links.lua" "$pkgdir/usr/share/$_name/rename-links.lua"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_name/LICENSE"
    # install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_name/README.md"

    # Manpage (falls vorhanden):
    if [[ -f "$_name.1" ]]; then
        install -Dm644 "$_name.1" "$pkgdir/usr/share/man/man1/$_name.1"
    fi

    # Changelog (falls vorhanden):
    if [[ -f CHANGELOG.md ]]; then
        install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_name/CHANGELOG.md"
    fi
}
