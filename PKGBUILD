# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=emacs-ess
pkgver=18.10.1
_pkgver=18.10-1
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
makedepends=('wget')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-${_pkgver}.tgz"{,.sig} no-html.diff)
sha256sums=('918537a62be6c3f5cef992787286ebbb0bb7cc75dad5124dc52ab1a57eb32b0c'
            'SKIP'
            'eda5cc1256e8470b92986c701fb4a7a2ddda25ce631a521f19d63afdc3cebb4b')
validpgpkeys=('3808603281971CFF6949D38A1248E0A068E0DB0F') # Martin Maechler, ETHZ

build() {
  cd ess-$_pkgver
  make prefix=/usr all
}

prepare()  {
  cd ess-$_pkgver
  patch -Np1 < "$srcdir"/no-html.diff
}

package() {
  cd ess-$_pkgver
  make DESTDIR="$pkgdir"/usr INFODIR="$pkgdir"/usr/share/info/ install
}
