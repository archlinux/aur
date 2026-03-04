pkgname=kustomrunner
pkgver=1.0.0
pkgrel=1
pkgdesc="Kustomrunner – customizable script runner"
arch=('any')
license=('MIT')
depends=('bash' 'python')
source=("kustomrunner-1.0.0-beta.tar.gz")
sha256sums=('SKIP')

package() {
    # Install into /opt
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname/"

    # Create binary launcher
    install -dm755 "$pkgdir/usr/bin"
    echo "#!/bin/bash
/opt/$pkgname/main.sh" > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Kustomrunner
Exec=/usr/bin/kustomrunner
Icon=utilities-terminal
Type=Application
Categories=Utility;
EOF
}
