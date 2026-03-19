# Maintainer: DissoWharf <your-email@example.com>
pkgname=mindful-path
pkgver=1.0.1
pkgrel=1
pkgdesc="A Buddhist-inspired daily habit tracker for students"
arch=('any')
url="https://github.com/DissoWharf/mindful-path"
license=('MIT')
depends=('python' 'python-pyqt6')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DissoWharf/mindful-path/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('57ef88037c834113e3836b0fe2a4d7bc31ee1df065a8b3ae7919baaf5e76e2ac')

package() {
    cd "$srcdir/mindful-path-$pkgver"

    # App directory
    install -d "$pkgdir/opt/mindful-path"
    install -d "$pkgdir/opt/mindful-path/ui"
    install -d "$pkgdir/opt/mindful-path/resources"

    # Python source files
    install -m 644 main.py         "$pkgdir/opt/mindful-path/"
    install -m 644 database.py     "$pkgdir/opt/mindful-path/"
    install -m 644 sound.py        "$pkgdir/opt/mindful-path/"
    install -m 644 generate_icon.py "$pkgdir/opt/mindful-path/"
    install -m 644 ui/*.py         "$pkgdir/opt/mindful-path/ui/"
    install -m 644 resources/*.qss "$pkgdir/opt/mindful-path/resources/"

    # Launcher script
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/mindful-path" << 'EOF'
#!/usr/bin/env bash
exec /usr/bin/python3 /opt/mindful-path/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/mindful-path"

    # Desktop entry
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/mindful-path.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Mindful Path
GenericName=Habit Tracker
Comment=A Buddhist-inspired daily practice tracker for students
Exec=mindful-path
Icon=mindful-path
Terminal=false
Categories=Education;Utility;
Keywords=habits;mindfulness;meditation;study;buddhism;tracker;
StartupWMClass=mindful-path
StartupNotify=true
EOF

    # License
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
