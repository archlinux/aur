# Maintainer: Giusy Margarita <kurmikon at libero dot it>

pkgname=korla-icon-theme
pkgver=1.0.3
pkgrel=3
pkgdesc="Korla icon theme suitable for every desktop environment, dark and light versions"
arch=("any")
url="https://github.com/bikass/korla"
license=("GPL3")
depends=("gtk-update-icon-cache")
optdepends=(
    "hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme"
    "breeze-icons: fallback Breeze icon theme"
    "gnome-icon-theme: fallback Gnome icon theme")
install="$pkgname.install"
source=("https://github.com/bikass/korla/archive/v$pkgver.tar.gz")
md5sums=("a52a1b62ed2dbed2223ea0ec41a97370")

_iconpath=usr/share/icons

package() {
    install -dm755 "$pkgdir/$_iconpath"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    
    # The following --no-preserve=mode option is necessary since the creator works with 
    # the theme locally and he messed with modes in the past making some icons unreadable 
    # and some directories not executable if installed system wide while he didn't notice 
    # any issue because he installed the theme under the local icon folder on his system.
    cd "$srcdir/korla-$pkgver"
    cp -dr --no-preserve=mode "korla" "$pkgdir/$_iconpath/korla"
    cp -dr --no-preserve=mode "korla-light" "$pkgdir/$_iconpath/korla-light"
    
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "korla/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    cd "$pkgdir/$_iconpath"
    rm -f "korla/create-new-icon-theme.cache.sh"
    rm -f "korla-light/create-new-icon-theme.cache.sh"
    rm -f "korla/LICENSE"
    rm -f "korla-light/LICENSE"
}
