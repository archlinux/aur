# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

_pkgname=bazarr
pkgname=$_pkgname-git
pkgver=r360.4c352b8
pkgrel=1
pkgdesc="Manage and download subtitles for Sonarr."
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
depends=('python'
         'python-apscheduler'
         'python-babelfish'
         'python-bottle'
         'python-bottle-fdsend'
         'python-dogpile.cache'
         'python-enzyme'
         'python-gitpython'
         'python-pillow'
         'python-py-pretty'
         'python-pycountry'
         'python-requests'
         'subliminal'
         'python-urllib3'
         'python-waitress')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git+https://github.com/morpheus65535/bazarr"
        "bazarr.sh"
        "bazarr.service"
        "bazarr.sysusers")
sha256sums=('SKIP'
            '47f59d5acf0df99d8dabfec617fdc57d7620d7843ce871dedc7f46cdae9c7420'
            '9e911b1498fe3eb68ee665ec8640c2636ab94822abe86aa9b4e816755e80e5ba'
            '288dbffb34c13cc6e3d599144138dd5d0de2ef40807649e3641669a0cb0788fa')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -i "/update_modules/d" bazarr.py
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  cp -dpr --no-preserve=ownership bazarr "${pkgdir}/usr/share/bazarr"
  install -Dm755 bazarr.sh "${pkgdir}/usr/bin/bazarr"
  install -Dm644 bazarr.service "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -Dm644 bazarr.sysusers "$pkgdir/usr/lib/sysusers.d/bazarr.conf"
}
