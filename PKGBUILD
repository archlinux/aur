# This file is part of BlackArch Linux ( http://blackarch.org ).
# See COPYING for license details.

pkgname="btrbck"
pkgver="2.0"
pkgrel=1
pkgdesc="Backup tool leveraging BTRFS for incremental backups."
arch=("any")
url="https://github.com/ruediste/btrbck"
depends=("java-environment")
license=("GPL3")
_jar_name="${pkgname}-cli-${pkgver}.jar"
noextract=("${_jar_name}")
source=("https://github.com/ruediste/btrbck/releases/download/2.0/${pkgname}-cli-${pkgver}.jar")
sha1sums=('ef0af5722e5868f150106ffea550bf91485bb52b')

package() {
    cd "$srcdir"

    mkdir -p "$pkgdir/usr/bin"

    install -Dm644 $_jar_name "$pkgdir/usr/share/$pkgname/$_jar_name"

    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec \$JAVA_HOME/bin/java -jar /usr/share/$pkgname/$_jar_name "\$@"
EOF

    chmod +x "$pkgdir/usr/bin/$pkgname"
}
