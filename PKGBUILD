pkgname=paramountplus-bin
_pkgname=Paramountplus-bin
name=ParamountPlus
_name=paramountplus
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Paramount+ desktop application"
arch=('x86_64')
url="https://gitlab.com/paramountplus/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("paramountplus-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/"$_name"/binaries/"$pkgver"-"$pkgrel"/-/raw/main/"$name"-linux-x64.tar.gz")

package() {
    for dir in $name-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/$name"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$name"
    cp -r "$pkgdir/opt/$name/$_name.svg" "$pkgdir/usr/share/pixmaps"  
    
    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/"$name"/"$_name"" "$pkgdir/usr/bin/"$_name""

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/"$name".desktop" \
        "$pkgdir/usr/share/applications/"$name".desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/"$name".desktop"
}
