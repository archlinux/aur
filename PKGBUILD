#Maintainer  : Thomas LEGRAND
#Contributor : Alexis Bienvenue
#Contributor : fabmen

pkgbase='auto-multiple-choice'
pkgname='auto-multiple-choice'
pkgver='1.3.0'
pkgrel='1'
pkgdesc="AMC est un ensemble d'utilitaires permettant de créer, gérer et corriger automatiquement des questionnaires à choix multiples (QCM)"
arch=('i686' 'x86_64')
url='http://home.gna.org/auto-qcm/'
license=('GPL')
depends=('perl-glib-object-introspection'
'perl-locale-gettext' 'perl-xml-writer' 'perl-xml-simple'
 'perl-dbd-sqlite' 'perl-file-mimeinfo' 'ttf-linux-libertine'
  'perl-text-csv' 'perl-dbi' 'perl-archive-zip'
  'graphicsmagick' 'texlive-bin' 'texlive-core'
  'gtk2-perl' 'netpbm' 'opencv' 'poppler')
source=('http://download.gna.org/auto-qcm/'$pkgbase'_current_precomp.tar.gz'  'amc.patch')  
#source=('http://download.gna.org/auto-qcm/'$pkgbase'_'$pkgver'_precomp.tar.gz'  'amc.patch')

md5sums=('72c21810103b82e085dccd133b07a397'
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
