# Maintainer: Lucas Frendorf <lucasfrendorf@gmail.com>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgbase=plasma6-themes-chromeos-kde-git
pkgname=(plasma6-themes-chromeos-kde-git)
_pkgname=ChromeOS-kde
pkgver=r92.7aef477
pkgrel=1
pkgdesc="ChromeOS theme for kde plasma"
arch=(any)
url="https://github.com/vinceliuice/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')
optdepends=('chromeos-gtk-theme: Matching GTK theme'
            'kvantum: Better theme engine (Recommended)'
            'tela-icon-theme: Matching icon theme')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname%-git}"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
    cd "$srcdir/${_pkgname%-git}/sddm/6.0"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
}

package() {
    # Auroae, color-scheme, Kvantum, Plasma and Wallpaper
    cd "$srcdir/${_pkgname%-git}"
    install -d "$pkgdir/usr/share"
    ./install.sh

    # Install SDDM theme
    cd "$srcdir/${_pkgname%-git}/sddm/6.0"
    install -d "$pkgdir/usr/share/sddm/themes"
    ./install.sh
}