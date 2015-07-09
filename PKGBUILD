# Maintainer: François Magimel <magimel.francois@gmail.com>
# Contributor: Austin <doorknob60 at gmail dot com>
pkgname=fofix-git
pkgver=v4.0.0alpha1.607.g3fe0f93
epoch=1
pkgrel=1
pkgdesc="fretsonfire X (FoFiX). Highly improved version of Frets on Fire (GIT Version)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fofix/"
license=('GPL')
groups=('games')
depends=('ffmpeg' 'python2' 'python2-pygame' 'python2-opengl'
'python2-numpy'
'python2-imaging' 'pyogg' 'pyvorbis' 'python2-pysqlite' 'libffi' 'cython2' 'soundtouch' 'glu')
optdepends=('pyaudio: microphone support')
makedepends=('git')
install=${pkgname}.install
source=('fofix-git.desktop' 'fofix-git.png' 'git+http://github.com/fofix/fofix.git')
md5sums=('b7f141bb1045159e5075ecdb3f59adff' 'f886a7fdfa7592b50aa9f62901910e03' 'SKIP')

pkgver() {
		  cd "$_gitname"
		    git describe --always | sed 's|-|.|g'
	}

_gitname="fofix"

build() {
  cd "$srcdir/fofix"


python2 setup.py build_ext --inplace --force
}

package() {
install -d $pkgdir/usr/
install -d $pkgdir/usr/share/
install -d $pkgdir/usr/share/applications/
install -d $pkgdir/usr/share/pixmaps/
install -d $pkgdir/usr/bin/
install -d $pkgdir/opt/
cd ${srcdir}
cp ${startdir}/fofix-git.desktop ${pkgdir}/usr/share/applications/
cp ${startdir}/fofix-git.png ${pkgdir}/usr/share/pixmaps/
mv ${srcdir}/fofix $pkgdir/opt/fofix-git
cd $pkgdir/usr/bin/
echo "#/bin/sh" > fofix-git
echo "cd /opt/fofix-git/" >> fofix-git
echo "python2 ./FoFiX.py" >> fofix-git
chmod +x fofix-git
chmod -R 777 $pkgdir/opt/fofix-git
}
