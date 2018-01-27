# Maintainer: Wolfgang Mader <Wolfgang dot Mader at brain-frog dot de>

pkgname=paperless
pkgver=1.1.0
pkgrel=4
pkgdesc="Scan, index, and archive all of your paper documents"
arch=('any')
url="https://github.com/danielquinn/paperless"
license=('GPL3')
options=(!buildflags)
depends=('python-django' 'python-django-extensions' 'python-django-rest-framework' 'python-django-crispy-forms' 'python-django-filter' 'python-fuzzywuzzy' 'python-pyocr' 'python-gnupg' 'python-pilkit' 'python-dotenv' 'paython-dateutils' 'python-magic' 'python-django-flat-responsive' 'python-langdetect' 'tesseract' 'unpaper' 'ghostscript')
source=("https://github.com/danielquinn/${pkgname}/archive/${pkgver}.tar.gz"
        paperless.conf
        paperless-consumer.service
        paperless-webserver.service)
sha512sums=('446c19da97276d9832d712c8cea23d56f435162a207de842603e60fd863ca6b1bd8a7671692040b40cd74e803ee9cca48dfb639870523b00f15e0f7198d9d707'
            'eb453491ad689505db8e1f9ca91a292eff0ad6ffaf530ed6c6d9b28131379b29d055bdf2533b8d18f2ad590054b24ccaa7df0880c4d89f66c0fce84473445e40'
            'ddf9988e5e479e41558bda7fc866e181aebc1f18d13214dfd09a51a54227a0b885046e63e018b9360ff6e4af3d4998a4af3bc6ce0cefdba42d165fa2d9cf735c'
            'd607f7393571d0b7bbeaa27a2b6084dfad03097734b288a1ff848d9309a5dd59cf72924c6d0eeedb8f8afa9a08716349c6546ac3b30bb0db34dd45cbb87c87b4')
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
