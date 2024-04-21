# Maintainer: Lucas Frendorf <lucasfrendorf@gmail.com>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgbase=plasma6-themes-chromeos-kde-git
pkgname=(plasma6-themes-chromeos-kde-git)
_pkgname=ChromeOS-kde
pkgver=r81.1df8fd7
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
            'tela-icon-theme: Matching icon theme')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname%-git}"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
    cd "$srcdir/${_pkgname%-git}/sddm"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
}

package_chromeos-kde-git() {
    provides=('chromeos-kde')


    # Run install script from GitHub
    cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/usr/share"
    ./install.sh

    # SDDM theme
    cd "$srcdir/${pkgname%-git}/sddm"
    install -d "$pkgdir/usr/share/sddm/themes"
    ./install.sh
}