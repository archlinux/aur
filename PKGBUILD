# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=bazarr
pkgver=0.7.1
pkgrel=1
pkgdesc="Manage and download subtitles for Sonarr and Radarr."
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
depends=('python2'
         'python2-apprise'
         'python2-apscheduler'
         'python2-babelfish'
         'python2-bottle'
         'python2-bottle-fdsend'
         'python2-dogpile.cache'
         'python2-gitpython'
         'python2-langdetect'
         'python2-logutils'
         'python2-pillow'
         'python2-py-pretty'
         'python2-pycountry'
         'python2-pytz'
         'python2-requests'
         'python2-tzlocal'
         'python2-urllib3'
         'python2-waitress'
         'python2-webtest'
         'python2-gevent')

makedepends=('git')
source=("bazarr-${pkgver}.tar.gz::https://github.com/morpheus65535/bazarr/archive/v${pkgver}.tar.gz"
        'bazarr.service'
        'bazarr.sysusers'
        'bazarr.install'
        'bazarr.tmpfiles')

sha256sums=('69a4bbf0b93ea53bdc09929e9ac09ead2ab34a46be397bd1a06b5efc7c419620'
            'b9e739e66eeabe5e9768db791d0d930e7f3cbaba6d2253a5973f8034ca12a8e7'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '573beeac951d427e980332ce4d8645ae2299082e6c9c04f96e2a41a98c3acc60'
            '3aa2ebbf4083301d331f36486edcb81fcd094767a0ea404a89d870217d4f6632')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/bazarr"

  # Remove any .gitignore files
  find "${srcdir}/bazarr-${pkgver}/" -name '.gitignore' -delete

  # Remove the empty data folder from the installation
  rm -rf "${srcdir}/bazarr-${pkgver}/data"

  cp -dpr --no-preserve=ownership "${srcdir}/bazarr-${pkgver}/"* "${pkgdir}/usr/lib/bazarr"

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
