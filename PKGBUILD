# Maintainer: twistedturtle <hindredkin at gmail.com>
pkgname=dmotp-git
pkgver=r23.3f6e821
pkgrel=1
pkgdesc="CLI TOTP authenticator"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/dmotp/dmotp"
license=('GPL2')
depends=("python" "python-pyotp" "python-cryptography" "python-pyperclip")
makedepends=('git')
optdepends=("xsel" "xclip")
provides=("dmotp")
source=("git+https://gitlab.com/dmotp/dmotp.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}



package() {
    cd "$srcdir/${pkgname%-git}"

    install -Dm755 "$srcdir/dmotp/dmotp" "$pkgdir/usr/share/dmotp/dmotp"
    install -Dm644 "$srcdir/dmotp/columnise.py" "$pkgdir/usr/share/dmotp/columnise.py"

    mkdir "$pkgdir/usr/bin/"
    ln -s "/usr/share/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/"
}
