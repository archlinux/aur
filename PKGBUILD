# Maintainer: Moritz Sauter <moritz.sauter7+aur at gmail dot com>

pkgname=wayland-idle-inhibitor-git
pkgver=r2.46a5077
pkgrel=1
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
    'b5b95ef9ca13dbd03b4b6816036542a92c860a9bdeabfaf4dd7a24fff3201f6cc57bc698143c654ba40da3e0aa2c6f7774d7d211eaa82196f497ace4a01cd4e5'
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
