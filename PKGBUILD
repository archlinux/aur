# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=adwaita-colors-icon-theme
_reponame=Adwaita-colors
pkgver=2.6
_commit=7d838af258da4ca05040760301d05140aa858145 # Release tag commit
pkgrel=2
pkgdesc="Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s accent color feature. It ensures that your Adwaita icons reflect the same accent color as your GNOME theme."
arch=(any)
url="https://github.com/dpejoh/Adwaita-colors"
license=(GPL3)
depends=("adwaita-icon-theme" "adwaita-icon-theme-legacy")
makedepends=("git")
conflicts=("adwaita-colors-icon-theme-git")
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

build() {
    cd "$srcdir/$_reponame"
    ./setup -i -f -p "$srcdir/generated-icons"
}

package() {
    install -dm755 "$pkgdir/usr/share/icons"

    cp -a "$srcdir/generated-icons"/Adwaita-* \
          "$pkgdir/usr/share/icons/"

    find "$pkgdir/usr/share/icons" \
        -name index.theme \
        -exec sed -i \
            's/Inherits=Adwaita,/Inherits=MoreWaita,Adwaita,/g' \
            {} +
}
