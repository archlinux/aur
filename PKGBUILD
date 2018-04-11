# Maintainer: Guatavo Alvarez <sl1pkn07@gmail.com>

pkgname=audiotools-git
pkgver=v3.1.1.127.g88d31ac3
pkgrel=1
pkgdesc="Collection of audio handling programs which work from the command line (GIT Version)"
arch=('x86_64')
url='http://audiotools.sourceforge.net'
license=('GPL')
depends=('python'
         'libcdio-paranoia'
         'libpulse'
         'opusfile'
         'twolame'
         'mpg123'
         'lame'
         'wavpack'
         'libdvd-audio-git'
         )
makedepends=('git'
             'python-setuptools'
             )
optdepends=('faad2: Decoding AAC'
            'faac: Encoding AAC'
            'neroaacdec: Decoding AAC (preferred)'
            'neroaacenc: Encoding AAC (preferred)'
            'mp3gain: For MP3 Replay Gain support'
            'vorbisgain: For OGG Replay Gain support'
            'python-pillow: for Coverview interface'
            'pygtk: for Coverview interface (GTK)'
            'python-pmw: Coverview interface (Tk)'
            'python-urwid: interactive modes'
            'cdrkit: for CD burning without cuesheets'
            'cdrtools: for CD burning without cuesheets'
            'cdrdao: for CD burning with cuesheets'
            )
conflicts=('audiotools')
provides=('audiotools')
source=('audiotools::git+https://github.com/tuffy/python-audio-tools.git')
sha1sums=('SKIP')

pkgver() {
  cd audiotools
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd audiotools

  sed -e 's|-m 644|-Dm 644|g' \
      -i Makefile \
      -i docs/Makefile
}

build() {
  cd audiotools
  python setup.py build
  make -C docs
}

package() {
  cd audiotools
  python setup.py install --root="${pkgdir}" --optimize=1
  make -C docs install MAN_PATH="${pkgdir}/usr/share/man"
}
