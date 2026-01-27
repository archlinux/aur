pkgname=fileman-bin
pkgver=1.0
pkgrel=1
pkgdesc="A Java/Swing basic File Manager (binary version)"
arch=('x86_64')
url="https://github.com/javadev/file-manager"
license=('MIT')
depends=('java-runtime')
provides=('fileman')
conflicts=('fileman-git')
source=("https://github.com/javadev/file-manager/raw/refs/heads/main/filemanager.jar")
b2sums=('7d645bce89f512a63f85ccca711baee90b71e828e5b4f6986521cda20325ae93af6d9214a24513cf3d7e5061ba25f4fd3f919e024993a79a6646a0e57f756903')

package() {

    #jar
    install -Dm644 filemanager.jar "$pkgdir/usr/share/fileman/fileman.jar"

    #launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/fileman" << 'EOF'
#!/bin/sh
exec java -jar /usr/share/fileman/fileman.jar "$@"
EOF

    #desktop
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/fileman.desktop" << EOF
[Desktop Entry]
Name=FileMan
Comment=Simple Java File Manager
Exec=fileman
Terminal=false
Type=Application
Categories=Utility;FileManager;
EOF
}
