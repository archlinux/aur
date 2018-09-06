# Maintainer: Wolfgang Mader <Wolfgang at Mad3r dot de>

pkgname=paperless
pkgver=2.2.1
pkgrel=1
pkgdesc="Scan, index, and archive all of your paper documents"
arch=('any')
url="https://github.com/danielquinn/paperless"
license=('GPL3')
options=(!buildflags)
depends=('python-django>=2.0' 'python-django-extensions>=2.1.2' 'python-django-rest-framework>=3.7.7' 'python-django-crispy-forms>=1.7.2' 'python-django-filter>=2.0.0' 'python-fuzzywuzzy>=0.16.0' 'python-pyocr>=0.5.2' 'python-gnupg>=0.4.3' 'python-pillow>=5.2' 'python-dotenv>=0.7.1' 'python-dateutil>=0.6.6' 'python-magic' 'python-langdetect>=1.0.7' 'tesseract' 'unpaper' 'ghostscript' 'python-dateparser>=0.7.0' 'python-pdftotext>=2.1.0' 'python-more-itertools>=4.3.0' 'python-levenshtein>=0.12' 'python-pytz>=2018.5' 'python-regex>=2018.08.29' 'python-django-cors-headers>=2.4.0' 'python-termcolor>=1.1.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        paperless.conf
        paperless-consumer.service
        paperless-webserver.service)
sha512sums=('8871a245a31020dddf56d586364eeb51158cfec9fab6a5d8c692ed29cc84a2916c2395358b5b7eb3289e3698c798b2e0a3058ec721cec654a3578c867d7c0aeb'
            'd5e2d34983d98b4e7435999cf1e5a758f9eeea9dc2c5352aa59c796059818fa48d7a3d3d431800ad5828554c258d9454d289cb17cce5edc658f5db4d6b4e3990'
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
