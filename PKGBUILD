pkgname=netlify-application
_pkgname=Netlify
pkgver=1.0.6
pkgrel=2
pkgdesc="Unofficial Netlify desktop application"
arch=('any')
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("git+https://gitlab.com/netlify-desktop/application")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    rm -rf .git
    cat <<EOT >> Netlify
    #!/bin/bash
    cd /opt/Netlify &&
    npm start
EOT

    chmod +x netlify
    ln -s "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/netlify"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/DisneyPlus"
    cp -r "$pkgdir/opt/DisneyPlus/Netlify.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/DisneyPlus/netlify" "$pkgdir/usr/bin/Netlify"

    # Desktop Entry
    install -Dm644 "$srcdir/application/DisneyPlus.desktop" \
        "$pkgdir/usr/share/applications/DisneyPlus.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/DisneyPlus.desktop"
}
