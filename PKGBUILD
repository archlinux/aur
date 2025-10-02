# Maintainer: twistedturtle <hindredkin at gmail.com>
pkgname=dmotp-git
pkgver=r16.5683202
pkgrel=1
pkgdesc="CLI TOTP authenticator"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/dmotp/dmotp"
license=('GPL2')
depends=("python" "python-pyotp" "python-cryptography" "python-pyperclip")
optdepends=("xsel" "xclip")
provides=("dmotp")
source=("git+https://gitlab.com/dmotp/dmotp.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/dmotp"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}



package() {
	cd "$pkgname"

	install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/share/$pkgname/$pkgname"
	install -Dm644 "$srcdir/$pkgname/columnise.py" "$pkgdir/usr/share/$pkgname/columnise.py"

	mkdir "$pkgdir/usr/bin/"
	ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/"
}
