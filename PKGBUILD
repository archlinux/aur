# Maintainer: Tiago Ribeiro <tiago.d.ribeiro@hotmail.com>
pkgname=systemd-services-manager
pkgver=1.0.1
pkgrel=1
pkgdesc="A GUI application to manage systemd services"
arch=('x86_64')
url="https://github.com/TiagoRibeiro25/systemd-services-manager"
license=('MIT')
depends=()  # No runtime dependencies needed if using PyInstaller
makedepends=('pyinstaller' 'python' 'git')  # PyInstaller from the AUR
source=("git+https://github.com/TiagoRibeiro25/systemd-services-manager.git")
sha256sums=('SKIP')  # Skip hashing for git source

build() {
    cd "$srcdir/$pkgname"
    pyinstaller --onefile ./src/app.py --name systemd-services-manager
}

package() {
    # Install the binary to /usr/bin
    install -Dm755 "$srcdir/$pkgname/dist/systemd-services-manager" "$pkgdir/usr/bin/systemd-services-manager"

    # Create desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/systemd-services-manager.desktop" <<EOF
[Desktop Entry]
Name=Systemd Services Manager
Exec=systemd-services-manager
Icon=systemd-services-manager
Type=Application
Categories=Utility;
EOF
}
