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

source=('https://gitlab.com/jojo_boulix/auto-multiple-choice/-/archive/1.4.0-rc2/auto-multiple-choice-1.4.0-rc2.zip'
'amc.patch' 'automultiplechoice.sty')  

md5sums=('0584e43f9605720206e0385451d26da5'
    '5d9e0db71f987cdf076dde0ecadb131f'
    '9e3717f2d521a075109c8c65003d4d09')
build() {
  #cd "$srcdir"/$pkgbase-$pkgver
  cd auto-multiple-choice-1.4.0-rc2
  patch -p 1 < $srcdir"/amc.patch"
  make all_precomp || return 1
}

package_auto-multiple-choice(){
  install='amc.install'
  cd auto-multiple-choice-1.4.0-rc2
  make DESTDIR="$pkgdir/" install
  sudo cp ../automultiplechoice.sty /usr/share/texmf/tex/latex/AMC/
}
