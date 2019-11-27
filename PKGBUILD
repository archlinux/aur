# Maintainer: Wolfgang Mader <Wolfgang at Mad3r dot de>

pkgname=paperless
pkgver=2.7.0
pkgrel=1
pkgdesc="Scan, index, and archive all of your paper documents"
arch=('any')
url="https://github.com/danielquinn/paperless"
license=('GPL3')
options=(!buildflags)
depends=('imagemagick' 'python-ply' 'python-django>=2.0.9' 'python-django-extensions>=2.1.3' 'python-django-rest-framework>=3.7.7' 'python-django-crispy-forms>=1.7.2' 'python-django-filter>=2.0.0' 'python-fuzzywuzzy>=0.16.0' 'python-pyocr>=0.5.3' 'python-gnupg>=0.4.3' 'python-pillow>=5.3' 'python-dotenv>=0.9.1' 'python-dateutil>=2.7.5' 'python-magic' 'python-langdetect>=1.0.7' 'tesseract' 'unpaper' 'ghostscript' 'python-dateparser>=0.7.0' 'python-pdftotext>=2.1.1' 'python-more-itertools>=4.3.0' 'python-levenshtein>=0.12' 'python-pytz>=2018.7' 'python-regex>=2018.11.2' 'python-django-cors-headers>=2.4.0' 'python-termcolor>=1.1.0' 'python-djangoql' 'optipng')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        paperless.conf
        paperless-consumer.service
        paperless-webserver.service)
sha512sums=('415dd86c4fcd561f25815498d4d05fb3d96d4fa58876cb8189a2cd5bef5ea150c494dc002e52479de641d3c87c0ef52a9a8c545bb8fb41ffad1d2aec350039c7'
            '5f5f208bb1613d24a422fae400be9c2e1798a7aba5595fd985abbfc55c84809cbc47625203d49dd15aa8f6cb5ab85282223bd29ba76c8c819698d60549c94287'
            'de3a825b24e310d6d97446cb7d206718eba10d6ab4c63c140a0325fe5e641d422bfdf0e39dc10406c37157ff6d2a45764a4d9c4f1559555e0023aef467d6f137'
            'c148bffd5b7cde4730043955921f9220251abf330c54f20169863edd2acf5d5a59b2c59cdf50fb3e4a09587e813a54ef334c0c96ea55c3b8e419ea032c42ccf3')
backup=("etc/paperless.conf")
_datadir="/usr/share/webapps/${pkgname}"
_systemddir="/usr/lib/systemd/system/"

install='paperless.install'

package() {
  mkdir -p "${pkgdir}"/etc
  install -m644 paperless.conf "${pkgdir}"/etc/paperless.conf

  mkdir -p "${pkgdir}"/${_systemddir}
  install -m644 paperless-consumer.service "${pkgdir}"/${_systemddir} 
  install -m644 paperless-webserver.service "${pkgdir}"/${_systemddir} 

  cd "${srcdir}"/${pkgname}-${pkgver}
  mkdir -p "${pkgdir}"/${_datadir}
  cp -R src "${pkgdir}"/${_datadir}
  
  install -m760 -d "${pkgdir}"/${_datadir}/data
  install -m760 -d -D "${pkgdir}"/${_datadir}/media/documents/originals
  install -m760 -d -D "${pkgdir}"/${_datadir}/media/documents/thumbnails
  chown -R http:http "${pkgdir}"/${_datadir}
}
