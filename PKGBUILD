# Maintainer: Moritz Sauter <moritz.sauter7+aur at gmail dot com>

pkgname=wayland-idle-inhibitor-git
pkgver=r2.46a5077
pkgrel=2
pkgdesc="An inhibitor that prevents wayland from idleing and locking the screen"
arch=("any")
url="https://github.com/stwa/wayland-idle-inhibitor"
license=('custom:WTFPL')
depends=("python-pywayland")
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=install
source=(
    "${pkgname%-git}::git+$url"
    "wayland-idle-inhibitor.service"
)
b2sums=(
    'SKIP'
    '775a6a39bc6e50b06ea3ad0754b0bd9614ec4ba37fea0cea5000b191ba718e3916511b3b4d31cc2b3b3b2f52563ac6441c882c0bbf3faaad1a68dccd8fba7cdf'
)

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    name=${pkgname%-git}

    install -Dm644 ../"$name.service" "$pkgdir/usr/lib/systemd/user/$name.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$name.py" "$pkgdir/usr/bin/$name.py"
}
