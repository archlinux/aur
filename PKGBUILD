# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

#modified to work with python2-oauth2client from [community] repository

pkgname=gcalcli-git
pkgver=3.3.2.r261.g4a55b6f
pkgrel=1
pkgdesc='Google Calendar Command Line Interface, modfied to work with
the package: python2-oauth2client from [community] repository.'
arch=('any')
url=https://github.com/insanum/gcalcli
license=('MIT')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-gflags'
'python2-oauth2client')
optdepends=('python2-vobject: for ics/vcal importing'
            'python2-parsedatetime: for fuzzy dates/times like "now", "today",
              "eod tomorrow", etc.')
source=('git+https://github.com/insanum/gcalcli')
md5sums=('SKIP')
conflicts=('gcalcli')
_gitname=gcalcli

pkgver() {
  cd $_gitname
  #git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
  echo "$(git describe --abbrev=0 --tags | cut -f 2 -d '-' | sed 's/v//').r$(git rev-list --count HEAD).$(git log -1 --format='g%h')"
}

prepare() {
  cd $_gitname
  sed -i -e 's/import\ run/import\ run_flow/' gcalcli
}

package() {
  cd $_gitname
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
