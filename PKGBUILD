# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=fentlauncher
pkgver=1.0.4
pkgrel=1
pkgdesc="Minecraft Launcher for FENTCRAFT"
arch=('x86_64')
url="https://fentcraft.fun"
license=('custom')
depends=('icu' 'krb5' 'zlib' 'openssl')
options=('!strip' '!debug')

package() {
    # $startdir refers to the directory where PKGBUILD is located (scripts/)
    local publish_dir="$startdir/../bin/Release/net9.0/linux-x64/publish"
    
    msg2 "Installing binaries from $publish_dir..."
    
    install -d "$pkgdir/opt/fentlauncher"
    
    if [ -d "$publish_dir" ]; then
        cp -r "$publish_dir/"* "$pkgdir/opt/fentlauncher/"
    else
        error "Publish directory not found: $publish_dir"
        return 1
    fi
    
    chmod 755 "$pkgdir/opt/fentlauncher/FENTLAUNCHER"

    install -Dm644 "$startdir/fentlauncher.desktop" "$pkgdir/usr/share/applications/fentlauncher.desktop"
    install -Dm644 "$startdir/../Assets/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/fentlauncher.png"
}
