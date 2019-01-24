# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=bazarr-git
pkgver=r858.35daaeb
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
provides=('bazarr')
conflicts=('bazarr')
source=('git+https://github.com/morpheus65535/bazarr'
        'bazarr.service'
        'bazarr.sysusers'
        'bazarr.tmpfiles'
        'bazarr.install')

sha256sums=('SKIP'
            'b9e739e66eeabe5e9768db791d0d930e7f3cbaba6d2253a5973f8034ca12a8e7'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '3aa2ebbf4083301d331f36486edcb81fcd094767a0ea404a89d870217d4f6632'
            '573beeac951d427e980332ce4d8645ae2299082e6c9c04f96e2a41a98c3acc60')

pkgver() {
  cd "bazarr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/bazarr"
  cp -dpr --no-preserve=ownership "${srcdir}/bazarr" "${pkgdir}/usr/lib/"
  rm -rf ${pkgdir}/usr/lib/bazarr/.git
  find ${pkgdir}/usr/lib/bazarr/ -name '*.gitignore' -delete
  find ${pkgdir}/usr/lib/bazarr/ -name '*.gitattributes' -delete

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
