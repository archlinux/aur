# Maintainer: Phantomwise <phantomwise67@protonmail.com>
pkgname=sausage-git
pkgver=0.0.4.r0.ge1843d8
pkgrel=3
pkgdesc="A terminal word-forming game written in Bash"
arch=('any')
url="https://gitlab.com/christosangel/sausage"
license=('MPL-2.0')
backup=('etc/sausage/dictionary.txt' 'etc/sausage/sausage.config')
depends=('bash' 'coreutils' 'ncurses')
makedepends=('git')
provides=("sausage")
conflicts=("sausage")
install=sausage-git.install
source=("sausage::git+${url}.git"
        "sausage.config")
sha256sums=('SKIP'
            'a47278230b77083456f19230c339b9470fc0e65559bc45a5cd212cfc32beb605')

pkgver() {
    cd "$srcdir/sausage"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/sausage"

    # Install the main executable
    install -Dm755 sausage.sh "$pkgdir/usr/bin/sausage"

    # Install game data files
    install -Dm644 rules.txt "$pkgdir/usr/share/sausage/rules.txt"

    # Install dictionary file
    install -Dm644 dictionary.txt "$pkgdir/etc/sausage/dictionary.txt"

    # Install config file
    install -Dm644 "$srcdir/sausage.config" "$pkgdir/etc/sausage/sausage.config"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sausage/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/sausage/README.md"

    # Install screenshots
    install -d "$pkgdir/usr/share/sausage/screenshots"
    install -Dm644 screenshots/* "$pkgdir/usr/share/sausage/screenshots/" 2>/dev/null || true
}