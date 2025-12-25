# Maintainer: everyoneexe <everyoneexe@example.com>
pkgname=quickshell-greetd
pkgver=1.0.2
pkgrel=1
pkgdesc="Use Quickshell lockscreen as greetd greeter"
arch=('any')
url="https://github.com/everyoneexe/quickshell-greetd"
license=('MIT')
depends=('quickshell' 'greetd' 'cage')
backup=('etc/greetd/config.toml')
install=quickshell-greetd.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 launcher/quickshell-greetd-launcher "$pkgdir/usr/bin/quickshell-greetd-launcher"
    install -Dm644 themes/ii-greeter.qml "$pkgdir/usr/share/quickshell-greetd/greeter.qml"
    install -Dm644 examples/greeter.qml "$pkgdir/usr/share/quickshell-greetd/examples/simple-greeter.qml"
    install -Dm644 README.md "$pkgdir/usr/share/doc/quickshell-greetd/README.md"
    
    # Default greetd config
    install -Dm644 /dev/stdin "$pkgdir/etc/greetd/config.toml.example" << 'EOF'
[terminal]
vt = 1

[default_session]
command = "/usr/bin/quickshell-greetd-launcher"
user = "greeter"

[initial_session]
command = "/usr/bin/quickshell-greetd-launcher"
user = "greeter"
EOF
}
