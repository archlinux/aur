pkgname=keyboard-chattering-fix-git
_pkgname=KeyboardChatteringFix-Linux
pkgver=r23.5bb686b
pkgrel=1
pkgdesc="A tool for blocking mechanical keyboard chattering on Linux using libevdev."
arch=('any')
url="https://github.com/finkrer/KeyboardChatteringFix-Linux"
license=('MIT')
depends=('python' 'python-evdev')
makedepends=('git')
provides=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"

    install -d "$pkgdir/usr/share/$_pkgname"
    cp -r src/ "$pkgdir/usr/share/$_pkgname/"

    install -d "$pkgdir/usr/bin"
    cat <<EOF >"$pkgdir/usr/bin/keyboard-chattering-fix"
#!/bin/sh
cd /usr/share/$_pkgname
sudo python3 -m src "\$@"
EOF

    chmod +x "$pkgdir/usr/bin/keyboard-chattering-fix"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
