# Maintainer: Wolfgang Mader <Wolfgang at Mad3r dot de>

pkgname=paperless
pkgver=2.6.0
pkgrel=1
pkgdesc="Scan, index, and archive all of your paper documents"
arch=('any')
url="https://github.com/danielquinn/paperless"
license=('GPL3')
options=(!buildflags)
depends=('python-django>=2.0.9' 'python-django-extensions>=2.1.3' 'python-django-rest-framework>=3.7.7' 'python-django-crispy-forms>=1.7.2' 'python-django-filter>=2.0.0' 'python-fuzzywuzzy>=0.16.0' 'python-pyocr>=0.5.3' 'python-gnupg>=0.4.3' 'python-pillow>=5.3' 'python-dotenv>=0.9.1' 'python-dateutil>=2.7.5' 'python-magic' 'python-langdetect>=1.0.7' 'tesseract' 'unpaper' 'ghostscript' 'python-dateparser>=0.7.0' 'python-pdftotext>=2.1.1' 'python-more-itertools>=4.3.0' 'python-levenshtein>=0.12' 'python-pytz>=2018.7' 'python-regex>=2018.11.2' 'python-django-cors-headers>=2.4.0' 'python-termcolor>=1.1.0' 'optipng')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        paperless.conf
        paperless-consumer.service
        paperless-webserver.service)
sha512sums=('733cb67a7af6d09eec18fb3246b35c6010cb84fc0571b25c3f4236386a604d97ec5b8278f9929e1b28bdd64dd38a696c27462eb0bbe36121662cd47b417d9d19'
            '3b57ccd9515b23847dc366fb8183ec4c1fd1c27a5186d5ed5f0a4c7d5d1be1e2adac625d7525b1a710727fcd2b8e8693305997ce6b8b6b683fa4dfa0fdc1a20a'
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
