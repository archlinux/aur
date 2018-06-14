# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

_pkgname=bazarr
pkgname=$_pkgname-git
pkgver=r489.d130adf
pkgrel=1
pkgdesc="Manage and download subtitles for Sonarr and Radarr."
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
depends=('python2'
         'subliminal'
         'python2-apprise'
         'python2-apscheduler'
         'python2-babelfish'
         'python2-bottle'
         'python2-bottle-fdsend'
         'python2-dogpile.cache'
         'python2-enzyme'
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
         'python2-webtest')

makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/morpheus65535/bazarr'
        'bazarr.service'
        'bazarr.sysusers'
        'bazarr.tmpfiles')

sha256sums=('SKIP'
            'e3c57f1a1d9ddd87d097efe2df5148f10de79c445fe6eee158f64b4335f3e174'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '2087276827bb090edf8743d5debfcc22a0c434b36d3b680bbea85dbd9a3b4539')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/bazarr"
  cp -dpr --no-preserve=ownership "${srcdir}/bazarr" "${pkgdir}/usr/lib/"
  rm -rf ${pkgdir}/usr/lib/bazarr/.git
  rm -f ${pkgdir}/usr/lib/bazarr/.gitignore ${pkgdir}/usr/lib/bazarr/.gitattributes

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
