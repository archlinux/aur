# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dragonfire-bin
pkgver=1.1.1
pkgrel=2
pkgdesc="The open-source virtual assistant for Linux"
arch=('x86_64')
url="https://dragon.computer"
license=('MIT')
provides=('dragonfire')
depends=('gtk2'
         'python-wikipedia'
         'python-pyuserinput'
         'python-tinydb'
         'youtube-dl'
         'python-spacy'
         'python-pyowm'
         'python-tensorflow'
         'python-deepspeech'
         'python-requests'
         'python-nltk'
         'python-httplib2'
         'python-tweepy'
         'python-waitress'
         'python-speechrecognition'
         'python-pyjwt'
         'python-sqlalchemy'
         'python-pymysql'
         'python-msgpack'
         'python-deeppavlov'
         'python-metadata-parser'
         'python-neuralcoref'
         'python-hug-middleware-cors')
optdepends=('python-pyqtgraph'
            'python-peakutils'
            'flake8'
            'python-sphinx'
            'python-sphinx_rtd_theme'
            'python-recommonmark'
            'm2r'
            'python-pytest'
            'python-pytest-cov'
            'python-codecov')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/DragonComputer/Dragonfire/releases/download/v${pkgver}/dragonfire_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/DragonComputer/Dragonfire/raw/master/LICENSE.txt')
sha256sums=('d66fdcb92a2ab1e91ea780611ae98327d03c05841164499e35e01a28b84aece8'
            'fc1e02b1f56939243105678427a29355f8b84a2b0559f464c7182600df9a9749')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/lib/"
  _pythonversion=$(python --version | awk -F ' ' '{print substr($2, 1, length($2)-2)}')
  mv python3 python${_pythonversion}
  cd python${_pythonversion}
  mv dist-packages site-packages
  sed -i "s|==|>=|" "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/${pkgname%-bin}-${pkgver}.egg-info/requires.txt"
}