# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=opensesame
pkgver=2.9.5
pkgrel=1
pkgdesc="A graphical, open-source experiment builder for the social sciences, with ability to deploy on Android"
arch=(any)
url="http://www.cogsci.nl/software/opensesame"
license=(GPL)
makedepends='git'
# This is a fairly minimal set of dependencies
depends=('python2' 'python2-pygame' 'python2-numpy' 'python2-pyqt4'
'python2-qscintilla' 'python2-qprogedit>=2.0.0' 'python2-imaging'
'python2-markdown' 'faenza-icon-theme' 'python2-yaml')
optdepends=('psychopy: PsychoPy backend'
'python2-expyriment: Expyriment backend'
'python2-pyserial: Serial/Parallel port communication')

options=(!emptydirs)
#source=(http://files.cogsci.nl/software/opensesame/opensesame_${pkgver}-1.tar.g
#python2.patch)
source=("$pkgname-$pkgver"::'git://github.com/smathot/OpenSesame.git#tag=release/2.9.5'
python2.patch)
md5sums=('SKIP'
         'b7238618028cffb2169c5b05a332e144')

fix_links() {
  cd  "$pkgdir/usr/share/opensesame/resources/theme/gnome/os-custom-icons/"
  ln -s ../../default/os-custom-icons/16x16/ .
  ln -s ../../default/os-custom-icons/24x24/ .
  ln -s ../../default/os-custom-icons/32x32/ .	
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -Np1 -i ../python2.patch
}
	 

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
#  fix_links
}

