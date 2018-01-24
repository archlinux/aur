# Maintainer: Wolfgang Mader <Wolfgang dot Mader at brain-frog dot de>

pkgname=paperless
pkgver=1.1.0
pkgrel=2
pkgdesc="Scan, index, and archive all of your paper documents"
arch=('any')
url="https://github.com/danielquinn/paperless"
license=('GPL3')
options=(!buildflags)
depends=('python-django' 'python-django-extensions' 'python-django-rest-framework' 'python-django-crispy-forms' 'python-django-filter' 'python-fuzzywuzzy' 'python-pyocr' 'python-gnupg' 'python-pilkit' 'python-dotenv' 'python-django-flat-responsive' 'python-langdetect' 'tesseract' 'unpaper')
source=("https://github.com/danielquinn/${pkgname}/archive/${pkgver}.tar.gz"
        paperless.conf
        paperless-consumer.service
        paperless-webserver.service)
sha512sums=('446c19da97276d9832d712c8cea23d56f435162a207de842603e60fd863ca6b1bd8a7671692040b40cd74e803ee9cca48dfb639870523b00f15e0f7198d9d707'
            'eb453491ad689505db8e1f9ca91a292eff0ad6ffaf530ed6c6d9b28131379b29d055bdf2533b8d18f2ad590054b24ccaa7df0880c4d89f66c0fce84473445e40'
            'd6dcd6c4bf102e1a527ef30e15cc1d8841cc10b270fe576f233e1d28b7773da81b2ddd94ccdc1e7202f65a750ef0a9d6d9bc59b951dceec28f9b7a1bc330ca5f'
            '9b93c34d7d5249be6dc15ed92e6914022c0d1a4f7af161f72379d73c215e7c4cc833befb1e28d02390573f41e9a99a6bcb9d77373d879c803c2f48510fc676e0')

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
