# Maintainer: Giusy Margarita <kurmikon at libero dot it>

pkgname=korla-icon-theme
pkgver=0.7.7
pkgrel=1
pkgdesc='Korla icon theme suitable for every desktop environment made by tarma'
arch=('any')
url='https://www.opendesktop.org/p/1256209/'
license=('GPL')
depends=('gtk-update-icon-cache')
optdepends=('breeze-icons: fallback Breeze icon theme'
    'gnome-icon-theme: fallback Gnome icon theme'
    'hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme')
makedepends=('unzip')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p" | head -n2))

source=("https://dl.opendesktop.org/api/files/download/id/1544012871/s/$_s/t/$_t/korla%200-7-7.zip")
md5sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/share/icons/"

    cp -r "$srcdir/korla" "$pkgdir/usr/share/icons/korla"
    
    chmod 755 $(find "$pkgdir/usr/share/icons/korla" -type d)
    chmod 644 $(find "$pkgdir/usr/share/icons/korla" -type f)
} 

post_install() {
    gtk-update-icon-cache -f -t "/usr/share/icons/korla/"
}
