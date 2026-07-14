# Maintainer: marco-l
pkgname=pacfz
pkgver=1.1.4
pkgrel=1
pkgdesc="Interactive fzf/CLI explorer for installed pacman packages, with a cached SQLite metadata store and per-package notes"
arch=('any')
url="https://codeberg.org/marco-l/pacfz"
license=('MIT')
depends=('python')
optdepends=('fzf: for pacfz'
            'python-textual: for pactui'
            'python-pytest: for unit testing')

source=("pacfz-1.1.4.tar.gz::https://codeberg.org/attachments/ad2fcb06-a76f-47bf-8e66-639c330d46a6")
sha256sums=('6bd57510b6f4f42336752f0dddaf5f2d08d441f85a5df43089f189deb099917c')

package() {
  cd "$pkgname"

  install -Dm755 src/pacfz "$pkgdir/usr/bin/pacfz"
  install -Dm755 src/pacq  "$pkgdir/usr/bin/pacq"
  install -Dm755 src/pactui "$pkgdir/usr/bin/pactui"

  install -d "$pkgdir/usr/share/pacfz/lib"
  install -Dm644 src/lib/config.py src/lib/notes_db.py src/lib/preview_item.py \
    src/lib/list_packages.py src/lib/create_db.py src/lib/note_manager.py \
    src/lib/pacman_log.py \
    -t "$pkgdir/usr/share/pacfz/lib/"

  install -Dm644 src/key-bindings.bash "$pkgdir/usr/share/pacfz/key-bindings.bash"
  install -Dm644 src/key-bindings.zsh "$pkgdir/usr/share/pacfz/key-bindings.zsh"

  install -Dm644 src/man/pacfz.1 src/man/pacq.1 src/man/pactui.1 \
    -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
