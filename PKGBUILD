# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=emacs-ess
pkgver=18.10.2
pkgrel=3
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
makedepends=('wget')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-${pkgver}.tgz"{,.sig} install_els.patch)
sha256sums=('f77b42283c698da091aabca9ccd14a648c3240f00898b93128490feefa04e9d6'
            'SKIP'
            '414aa1bf5dface6b59d090b80d6ce7107587f74a6caec7036ed8e48f66f8309e')
validpgpkeys=('3808603281971CFF6949D38A1248E0A068E0DB0F') # Martin Maechler, ETHZ

prepare() {
  cd "$srcdir"/ess-$pkgver
  patch -Np1 < "$srcdir"/install_els.patch
}

package() {
  cd ess-$pkgver
  make DESTDIR="$pkgdir"/usr INFODIR="$pkgdir"/usr/share/info/ install
}
