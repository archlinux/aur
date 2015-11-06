#Maintainer: Thomas LEGRAND
pkgbase='auto-multiple-choice'
pkgname='auto-multiple-choice'
pkgver='1.2.1'
pkgrel='1'
pkgdesc="AMC est un ensemble d'utilitaires permettant de créer, gérer et corriger automatiquement des questionnaires à choix multiples (QCM)"
arch=('i686' 'x86_64')
url='http://home.gna.org/auto-qcm/'
license=('GPL')
depends=('perl-locale-gettext' 'perl-xml-writer' 'perl-xml-simple'
 'perl-dbd-sqlite' 'perl-file-mimeinfo' 'ttf-linux-libertine'
  'perl-text-csv' 'perl-dbi' 'perl-archive-zip'
  'graphicsmagick' 'texlive-bin' 'texlive-core'
  'gtk2-perl' 'netpbm' 'opencv' 'poppler')
source=('http://download.gna.org/auto-qcm/'$pkgbase'_'$pkgver'_precomp.tar.gz'  'amc.patch')

md5sums=('fecb9007b315d53502be5ec0eb6901a8'
         'd3e490a6785f4df9a26424ee52e7100b')

build() {
  cd "$srcdir"/$pkgbase-$pkgver
  patch -p 1 < $srcdir"/amc.patch"
  make all_precomp|| return 1

}

package_auto-multiple-choice(){
  install='amc.install'
  cd "$srcdir"/$pkgbase-$pkgver
  make DESTDIR="$pkgdir/" install
}
