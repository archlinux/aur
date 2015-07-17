#Maintainer: max-k <max-k AT post DOT com>
#Contributor: Jonathan 'gishten' Gustafsson <mynick AT mynick DOT com>

pkgname=ampache-git
_gitname=ampache
pkgver=3.8.0.beta2.25.gf946a1c
pkgrel=4
pkgdesc="A PHP-based tool for managing and playing your audio/video files via a web interface"
arch=('i686' 'x86_64')
url="http://www.ampache.org/"
license=('GPL')
depends=('mariadb>=5.0' 'php>=5.4' 'curl')
makedepends=('git')
optdepends=('ffmpeg: all transcoding/downsampling'
            'lame: mp3 transcoding/downsampling'
            'vorbis-tools: ogg transcoding/downsampling'
            'flac: flac transcoding/downsampling'
            'faad2: m4a transcoding/downsampling'
            'mp3splt: mp3, ogg and flac downsampling')
conflicts=('ampache' 'ampache-development')
install=${_gitname}.install
source=(git://github.com/${_gitname}/${_gitname}.git 'nginx-example.conf')
md5sums=('SKIP' '60c0e437bd20d5ba8a53f61768d037b6')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's|-|.|g'
}

build() {
  echo "" > /dev/null
}

package() {
  cd ${srcdir}/${_gitname}
  mkdir -p ${pkgdir}/srv/http/${_gitname}
  cp -a * ${pkgdir}/srv/http/${_gitname}/
  mkdir -p ${pkgdir}/usr/share/doc/${_gitname}
  install -D -m644 ${srcdir}/nginx-example.conf ${pkgdir}/usr/share/doc/
}

