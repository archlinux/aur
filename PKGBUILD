
# Maintainer: grepper<grepper@gmail.com>
# Submitter: grepper<grepper@gmail.com>
# Contributor: CRT<crt.011@gmail.com>
# Contributor: Alexandros Konstantinakis - Karmis <el04092@mail.ntua.gr>
# Contributor: Jeremie Lasalle Ratelle <lasallej@iro.umontreal.ca>
pkgname=tovid
pkgver=0.35.2
pkgrel=2
pkgdesc="A suite of tools for creating video DVDs"
depends=('mplayer' 'mjpegtools' 'ffmpeg' 'python2' 'tix' \
'imagemagick' 'dvdauthor' 'dvd+rw-tools' 'sox' 'normalize' 'bc')
optdepends=('transcode: faster for animated submenus (ffmpeg used otherwise)')
makedepends=('txt2tags')
arch=('i686' 'x86_64')
url='http://tovid.wikia.com'
license=('GPL')
conflicts=('tovid-svn' tovid-git)
source=(https://github.com/tovid-suite/tovid/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('be6f540d7f36bd44bf19814fc4457a1586ffe5975a7b6cc324c377597624e674')

build() {
  mv ${srcdir}/${pkgname}-${pkgname}-${pkgver} ${srcdir}/${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}

  for file in setup.py src/titleset-wizard; do
    sed -i 's/\/usr\/bin\/env.*$/\/usr\/bin\/python2/' $file
  done

  for file in src/todiscgui src/tovid-stats src/set_chapters; do
    sed -i 's/\/usr\/bin\/env.*$/\/usr\/bin\/python2/' $file
  done 

  sed -i 's/\/usr\/bin\/python.*$/\/usr\/bin\/python2/' src/tovid
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver} 
  python setup.py install --root="$pkgdir"
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
