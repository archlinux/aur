# Maintainer: Stefano Campanella <stefanocampanella1729@gmail.com>
pkgname=gr-git
_pkgid=${pkgname%-git}
pkgver=0.18.0.r67.g058c7a6
pkgrel=1
pkgdesc="A universal framework for cross-platform visualization applications"
arch=('i686' 'x86_64')
url="https://www.gr-framework.org/"
license=('GPL')
depends=('libx11' 'libxft' 'libxt' 'python2' 'python2-numpy' 'texlive-core' 'python2-opengl' 'mesa-libgl' 'python2-pyqt4' 'ghostscript' 'libmupdf' 'ffmpeg' 'gtk2' 'wxgtk' 'wxpython' 'glfw' 'zeromq' 'python2-pyzmq')
makedepends=('git')
provides=('gr')
source=("git://github.com/jheinen/gr.git"
        "GR.sh")
md5sums=('SKIP'
         '999585076fa84f29ef6c11591302ca3a')

pkgver() {
  cd $_pkgid
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd $_pkgid
  make ${MAKEFLAGS}
}

package() {
	cd $_pkgid
  make GRDIR="${pkgdir}/usr/"
	make install GRDIR="${pkgdir}/usr/" PYTHONBIN="/usr/bin/python2"
  install -D "${srcdir}/GR.sh" "${pkgdir}/etc/profile.d/GR.sh"
  rm ${pkgdir}/usr/bin/anaconda
}
