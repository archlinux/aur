# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instamenu
pkgver=2021.04.18
pkgrel=1
pkgdesc="dmenu like menu with the Dracula theme"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
depends=('python' 'libxinerama' 'libxft')
optdepends=('instamenu-extra: Extra script that instamenu can use'
        'instamenu-schemas: gsettings for instamenu'
        'siji: font used by default'
        'nerd-fonts-fira-code: font used by default'
        'adobe-source-code-pro-fonts: font used by default'
        'ttf-material-design-icons: font used by default'
        'ttf-remixicon: font used by default')
provides=($pkgname dmenu)
conflicts=(dmenu)
replaces=(dmenu)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('c284689218948ed6c3d5526cd56b01b5afe21fbee1818da77f27f1db17875509')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make \
        X11INC=/usr/include/X11 \
        X11LIB=/usr/lib/X11
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
