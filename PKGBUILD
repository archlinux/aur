# Maintainer: dakataca <🐬danieldakataca@gmail.com>
pkgname=unbound-roothints
pkgrel=1
pkgver=1.0.0.r22
pkgdesc="Automatically manages the root hint file /etc/unbound/root.hints"
arch=('x86_64')
url="https://codeberg.org/dakataca/unbound-roothints"
license=('MIT')
depends=('unbound')
makedepends=('git')
source=("$pkgname::git+$url.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "1.0.0.r$(git rev-list --count HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    # Instalar los Bash Scripts.
    install -Dm 755 "Bash Scripts/"* -t "$pkgdir/usr/local/bin/"

    # Instalar las unidades Systemd.
    install -Dm 644 "Systemd Units/"* -t "$pkgdir/etc/systemd/system/"

    # Crear directorio de temporizadores personalizados e instalar enlace simbólico del temporizador "roothints.timer"
    install -d "$pkgdir/etc/systemd/system/timers.target.wants/"
    cp -a roothints.timer "$pkgdir/etc/systemd/system/timers.target.wants/"
}

## Update:
# updpkgsums
# makepkg -si
# makepkg --printsrcinfo > .SRCINFO
# git clean -dfx

## References
# Repository: https://codeberg.org/dakataca/unbound-roothints
# WebHelp: https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html

## Clean:
# rm -rf src/

# 👤 Autor: https://t.me/dakataca 💻 🐬 #
