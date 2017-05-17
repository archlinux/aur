#Maintainer: max-k <max-k AT post DOT com>
pkgname=ampache
pkgver=3.8.2
pkgrel=4
pkgdesc="PHP web based audio/video streaming application and file manager"
arch=('i686' 'x86_64')
url="http://www.ampache.org/"
license=('GPL')
depends=('mariadb>=5.0' 'php>=5.3')
optdepends=('lame: all transcoding/downsampling'
                'vorbis-tools: all transcoding'
                'flac: flac transcoding/downsampling'
                'faad2: m4a transcoding/downsampling'
                'mp3splt: mp3 and ogg transcoding/downsampling')
conflicts=('ampache-git' 'ampache-development')
install="${pkgname}.install"
_sourcebase="https://github.com/${pkgname}/${pkgname}/releases/download"
source=("${_sourcebase}/${pkgver}/${pkgname}-${pkgver}_all.zip"
        "nginx-example.conf"
        "${pkgname}.install")
sha256sums=('b54a4f08248c4389e98ce3f680da0bbc1c19e388e379e6920dc601947acaa3e2'
            'd579f125fc85b6862dc2bd950b6aa3a4ffdad219323b8ee2c93282c8f223c3eb'
            'c58aecf20e05efb299cfc984d8aef1e53a9be3bc24d79978f08c1da0f137c2c5')

build() {
  echo "" > /dev/null
}

package() {
  cd ${srcdir}
  _targetdir="${pkgdir}/usr/share/webapps/${pkgname}"
  _docdir="${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p ${_targetdir}
  cp -r * ${_targetdir}/
  unlink ${_targetdir}/${pkgname}-${pkgver}_all.zip
  unlink ${_targetdir}/nginx-example.conf
  mkdir -p ${_docdir}
  install -D -m644 ${srcdir}/nginx-example.conf ${_docdir}/
}
