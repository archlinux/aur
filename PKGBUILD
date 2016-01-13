# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=opensesame
pkgver=3.0.5
pkgrel=1
pkgdesc="A graphical, open-source experiment builder for the social sciences, with ability to deploy on Android"
arch=(any)
url="http://www.cogsci.nl/software/opensesame"
license=(GPL)
makedepends='git'
# This is a fairly minimal set of dependencies
depends=('python2' 'python2-pygame' 'python2-pyqt4'
'python2-qscintilla' 'python2-qprogedit>=3.0.0' 'python2-yaml'
'python2-webcolors'
'python2-numpy' 'python2-pillow' 'python2-markdown'
'python2-scipy')

# scipy seems to be needed alongside numpy for synth to work

#'faenza-icon-theme'

optdepends=('psychopy: PsychoPy backend'
'python2-expyriment: Expyriment backend'
'python2-pyserial: Serial/Parallel port communication'
'python2-pyflakes: validation of python scripts'
'ipython2: improved debugging')

options=(!emptydirs)
#source=(http://files.cogsci.nl/software/opensesame/opensesame_${pkgver}-1.tar.g
#python2.patch)
source=("$pkgname-$pkgver"::'git://github.com/smathot/OpenSesame.git#tag=release/3.0.5'
python2.patch)
md5sums=('SKIP'
         '05241d9c2e0881c6eb3f4f7745aac4fb')

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

