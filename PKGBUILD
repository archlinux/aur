# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgname=falcon-client
_pkgname=falconsqlclient
pkgver=4.1.0
pkgrel=2
pkgdesc="Free, opensource, cross-platform SQL client"
arch=('x86_64')
url="http://github.com/plotly/falcon"
license=('MIT')
source=("https://github.com/plotly/falcon/releases/download/v4.1.0/linux-falcon-v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/plotly/falcon/master/app/icons/app.ico")
sha256sums=('7b3eb770b7df27edb8e905a092e1002399e88ec25374be4c8366ea2509c2fdfd'
            'bd0196d4e6c3cab3c7b4e1fa9517d9a700e2e149454ff9620b9b8be407ecf72d')
depends=('gconf')
build(){
    cd $srcdir
    cat > "$_pkgname" <<EOF
#!/usr/bin/env bash
exec /usr/share/$_pkgname/falcon-sql-client "\$@"                                                                                                  
EOF
    cat > "$_pkgname.desktop" <<EOF
[Desktop Entry]
Name=Falcon SQL Client
Exec=/usr/share/$_pkgname/falcon-sql-client
Icon=/usr/share/$_pkgname/app.ico
Terminal=false
Type=Application
Categories=Development
EOF
}

package() {
    mkdir -p $pkgdir/usr/{bin,share/applications}
    cd $pkgdir/usr/share
    tar -xzf $srcdir/linux-falcon-v$pkgver.tar.gz
    mv falcon-sql-client-$pkgver $_pkgname
    cp $srcdir/app.ico $_pkgname
    cp $srcdir/$_pkgname $pkgdir/usr/bin
    cp $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications
    chmod 755 "$pkgdir/usr/bin/$_pkgname"
}
