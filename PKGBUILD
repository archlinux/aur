# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=python2-scitools-git
pkgver=20150514
pkgrel=1
pkgdesc="python library for scientific computing, git version"
arch=(any)
url="https://github.com/hplgit/scitools"
license=('custom:BSD Simplified')
depends=('python2') 
makedepends=('python2' 'python2-numpy' 'gnuplot' 'python2-gnuplot' 'mercurial')
optdepends=('python2-scipy' 'python2-scientificpython' 'vtk')
provides=('python2-scitools')
conflicts=('python2-scitools')
replaces=('python2-scitools-hg')
source=('git+https://github.com/hplgit/scitools.git')
md5sums=('SKIP')

pkgver() {
 # Identify latest version.
 cd "$srcdir/scitools"
 git log -1 --format="%cd" --date=short | sed 's|-||g'
}  

package() {
  # Remove unwanted source folder.
  rm -rf ${startdir}/scitools
  
  # Install the package.
  cd "$srcdir/scitools"
  python2 setup.py install --root=$pkgdir

  # Copy the license file.
  mkdir -pv $startdir/pkg/$pkgname/usr/share/licenses/$pkgname
  install -m644 $srcdir/scitools/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}


