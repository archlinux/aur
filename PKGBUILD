# Maintainer: Wolfgang Mader <Wolfgang dot Mader at brain-frog dot de>

pkgname=paperless
pkgver=1.1.0
pkgrel=1
pkgdesc="Scan, index, and archive all of your paper documents"
arch=('any')
url="https://github.com/danielquinn/paperless"
license=('GPL3')
options=(!buildflags)
depends=('python-django' 'python-django-extensions' 'python-django-rest-framework' 'python-django-crispy-forms' 'python-django-filter' 'python-fuzzywuzzy' 'python-pyocr' 'python-gnupg' 'python-pilkit' 'python-dotenv' 'python-django-flat-responsive' 'python-langdetect' 'tesseract' 'unpaper')
#backup=("etc/webapps/${pkgname}/application.rb")
source=("https://github.com/danielquinn/${pkgname}/archive/${pkgver}.tar.gz"
        paperless.conf
        paperless-consumer.service
        paperless-webserver.service)
#install='gitlab.install'
sha512sums=(SKIP
            SKIP
            SKIP
            SKIP)

_datadir="/usr/share/webapps/${pkgname}"
_systemddir="/usr/lib/systemd/system/"

package() {
  mkdir -p ${pkgdir}/etc
  install -m600 paperless.conf ${pkgdir}/etc/paperless.conf

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
