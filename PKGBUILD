# Maintainer: marco-l
pkgname=pacfz
pkgver=1.2.0
pkgrel=1
pkgdesc="Interactive fzf/CLI explorer for installed pacman packages, with a cached SQLite metadata store and per-package notes"
arch=('any')
url="https://codeberg.org/marco-l/pacfz"
license=('MIT')
depends=('python')
optdepends=('fzf: for pacfz'
            'python-textual: for pactui'
            'python-pytest: for unit testing')

source=("pacfz-1.2.0.tar.gz::https://codeberg.org/marco-l/pacfz/releases/download/v1.2.0/pacfz-1.2.0.tar.gz")
sha256sums=('b96cb1f341c5de44a9a18c6565bdc765301912b48574ca5bbe86600ebffed965')

package() {
  cd "$pkgname"

  install -Dm755 src/pacfz "$pkgdir/usr/bin/pacfz"
  install -Dm755 src/pacq  "$pkgdir/usr/bin/pacq"
  install -Dm755 src/pactui "$pkgdir/usr/bin/pactui"

  install -d "$pkgdir/usr/share/pacfz/lib"
  install -Dm644 src/lib/config.py src/lib/notes_db.py src/lib/preview_item.py \
    src/lib/list_packages.py src/lib/create_db.py src/lib/note_manager.py \
    -t "$pkgdir/usr/share/pacfz/lib/"

  install -Dm644 src/key-bindings.bash "$pkgdir/usr/share/pacfz/key-bindings.bash"
  install -Dm644 src/key-bindings.zsh "$pkgdir/usr/share/pacfz/key-bindings.zsh"

  install -Dm644 src/man/pacfz.1 src/man/pacq.1 src/man/pactui.1 \
    -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
