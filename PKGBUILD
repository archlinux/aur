# Maintainer: Tom <tomemme@outlook.com>
pkgname=encrypted-journal-git
pkgver=0.r101.g711f4e1
pkgrel=1
pkgdesc="Encrypted desktop journal app (Tkinter + AES-GCM)"
arch=('any')
url='https://github.com/tomemme/EncryptedJournal'
license=('MIT')
depends=('python' 'tk' 'python-cryptography' 'python-pyenchant')
optdepends=('python-keyring: optional system keyring integration')
makedepends=('git')
provides=('encrypted-journal')
conflicts=('encrypted-journal')
source=('git+https://github.com/tomemme/EncryptedJournal.git#branch=omarchy-version')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/EncryptedJournal"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/EncryptedJournal"

  install -d "$pkgdir/usr/share/encrypted-journal"
  install -Dm755 secure_journal.py "$pkgdir/usr/share/encrypted-journal/secure_journal.py"
  install -Dm644 azure.tcl "$pkgdir/usr/share/encrypted-journal/azure.tcl"
  cp -r theme "$pkgdir/usr/share/encrypted-journal/"

  install -Dm755 packaging/arch/encrypted-journal-launcher \
    "$pkgdir/usr/bin/encrypted-journal"
  install -Dm644 packaging/arch/encrypted-journal.desktop \
    "$pkgdir/usr/share/applications/encrypted-journal.desktop"
  install -Dm644 theme/journal.png \
    "$pkgdir/usr/share/pixmaps/encrypted-journal.png"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
