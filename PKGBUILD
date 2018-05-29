# Maintainer: Wolfgang Mader <Wolfgang at Mad3r dot de>

pkgname=paperless
pkgver=1.3.0
pkgrel=2
pkgdesc="Scan, index, and archive all of your paper documents"
arch=('any')
url="https://github.com/danielquinn/paperless"
license=('GPL3')
options=(!buildflags)
depends=('python-django' 'python-django-extensions' 'python-django-rest-framework' 'python-django-crispy-forms' 'python-django-filter' 'python-fuzzywuzzy' 'python-pyocr' 'python-gnupg' 'python-pilkit' 'python-dotenv' 'python-dateutil' 'python-magic' 'python-django-flat-responsive' 'python-langdetect' 'tesseract' 'unpaper' 'ghostscript' 'python-dateparser' 'python-pdftotext')
source=("https://github.com/danielquinn/${pkgname}/archive/${pkgver}.tar.gz"
        paperless.conf
        paperless-consumer.service
        paperless-webserver.service)
sha512sums=('f7759a9685206e65fce2b8eb7eebf188136c303e7d6aee543657849e52931c5aa6cdfa8fab820718e72131891f6f7a328b03c7e756cc5151e7b5549bba3dd6ab'
            'eb453491ad689505db8e1f9ca91a292eff0ad6ffaf530ed6c6d9b28131379b29d055bdf2533b8d18f2ad590054b24ccaa7df0880c4d89f66c0fce84473445e40'
            'de3a825b24e310d6d97446cb7d206718eba10d6ab4c63c140a0325fe5e641d422bfdf0e39dc10406c37157ff6d2a45764a4d9c4f1559555e0023aef467d6f137'
            'c148bffd5b7cde4730043955921f9220251abf330c54f20169863edd2acf5d5a59b2c59cdf50fb3e4a09587e813a54ef334c0c96ea55c3b8e419ea032c42ccf3')
backup=("etc/paperless.conf" "usr/lib/systemd/system/paperless-webserver.service" "usr/lib/systemd/system/paperless-consumer.service")
_datadir="/usr/share/webapps/${pkgname}"
_systemddir="/usr/lib/systemd/system/"

package() {
  mkdir -p ${pkgdir}/etc
  install -m644 paperless.conf ${pkgdir}/etc/paperless.conf

  mkdir -p ${pkgdir}/${_systemddir}
  install -m644 paperless-consumer.service ${pkgdir}/${_systemddir} 
  install -m644 paperless-webserver.service ${pkgdir}/${_systemddir} 

  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/${_datadir}
  cp -R src ${pkgdir}/${_datadir}
  
  install -m760 -d ${pkgdir}/${_datadir}/data
  install -m760 -d -D ${pkgdir}/${_datadir}/media/documents/originals
  install -m760 -d -D ${pkgdir}/${_datadir}/media/documents/thumbnails
}
