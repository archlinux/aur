#Maintainer  : Benoit LANDRIEU
#Contributor : Thomas LEGRAND
#Contributor : Alexis Bienvenue
#Contributor : fabmen

pkgbase='auto-multiple-choice'
pkgname='auto-multiple-choice'
pkgver='1.4.0~rc2'
pkgrel='1'
pkgdesc="AMC est un ensemble d'utilitaires permettant de créer, gérer et corriger automatiquement des questionnaires à choix multiples (QCM)"
arch=('i686' 'x86_64')
url='http://auto-multiple-choice.net/'
license=('GPL')

depends=('perl' 'perl-glib-object-introspection'
 'perl-locale-gettext' 'perl-xml-writer' 'perl-xml-simple'
 'perl-dbd-sqlite' 'perl-file-mimeinfo' 'ttf-linux-libertine'
  'perl-text-csv' 'perl-dbi' 'perl-archive-zip'
  'graphicsmagick' 'texlive-bin' 'texlive-core'
  'gtk2-perl' 'netpbm' 'opencv' 'poppler' 'poppler-glib' 'perl-clone'
  'perl-gtk3'
  'glew' 'dblatex' 'vtk' 'hdf5')

source=('https://download.auto-multiple-choice.net/auto-multiple-choice_1.4.0_precomp.tar.gz'
'amc.patch')  

md5sums=('636aeb140829646ba3f223c69d75bd17'
         'b7ad3eacff70a99bbd99afae617a5bb3')

build() {
  #cd "$srcdir"/$pkgbase-$pkgver
  cd auto-multiple-choice-1.4.0
  patch -p 1 < $srcdir"/amc.patch"
  make all_precomp || return 1
}

package_auto-multiple-choice(){
  cd auto-multiple-choice-1.4.0
  make PERLDIR=/usr/share/perl5/vendor_perl DESTDIR="$pkgdir/" install
}
