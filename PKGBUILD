# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instawm
pkgver=2021.05.09
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="https://github.com/The-Repo-Club/instawm"
arch=('i686' 'x86_64')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'instamenu')
optdepends=('instawm-schemas: gsettings for instawm'
        'siji: font used by default'
        'nerd-fonts-fira-code: font used by default'
        'adobe-source-code-pro-fonts: font used by default'
        'ttf-material-design-icons: font used by default'
        'ttf-remixicon: font used by default')
install=instawm.install
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('87a46fe76b8ac3bd8ce8f172d6a28a74e9046d236eda4b0dba8c0f2418998281')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11 \
    FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}




