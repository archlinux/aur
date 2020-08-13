# Maintainer: Nico <desoxhd@gmail.com>
pkgname=lyrebird
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple and powerful voice changer for Linux, written in GTK 3."
arch=('any')
url="https://github.com/chxrlt/lyrebird"
license=('MIT')
depends=('python>=3.8' 'python-toml' 'gtk3')
optdepends=('pavucontrol: audio support')
conflicts=('lyrebird')
provides=('lyrebird')

source=("https://github.com/chxrlt/lyrebird/archive/v${pkgver}.tar.gz" "lyrebird.desktop" "config.toml")
sha256sums=('cf869cfd6b1237ad58ff8bd55fdf9f2032ba6d7159801395bec4a007245fd4ab' '912d5fbd57a0a1ea2a0f17bd41f9ddf687722c9c9ab88f51d3f33d3894417ca7' 'efe34e18fec84afca1bc64eaad4984125a35dfd55d1e8b604ede9186c6fda7e3')

package() {
    BIN_PATH="$pkgdir/usr/lib/python3.8/site-packages/$pkgname"
    CONFIG_PATH="$pkgdir/etc/$pkgname"

    # create dirs
    mkdir -p "$CONFIG_PATH"
    mkdir -p "$BIN_PATH"
    
    cd "$srcdir/$pkgname-$pkgver"
    
    # install config stuff
    install -Dm 644 "$srcdir/config.toml" "$CONFIG_PATH/config.toml"
    install -Dm 644 "presets.toml" "$CONFIG_PATH/presets.toml"
    
    # install python package
    cp -rf lyrebird "$BIN_PATH"
    install -Dm 755 "app.py" "$BIN_PATH"
    install -Dm 644 "icon.png" "$BIN_PATH/icon.png"
    
    # workaround (why is this path hardcoded in mainwindow.py?)
    install -Dm 644 "icon.png" "$pkgdir/usr/local/bin/$pkgname/icon.png"
    
    # setup desktop entry
    install -Dm 644 "icon.png" "$pkgdir/usr/share/pixmaps/lyrebird.png"
    install -Dm 644 "$srcdir/lyrebird.desktop" "$pkgdir/usr/share/applications/lyrebird.desktop"
}
