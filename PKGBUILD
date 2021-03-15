# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail
pkgname=goobook-git
_gitname=goobook
pkgver=3.5.1
pkgrel=2
pkgdesc="Search your google contacts from the command-line or mutt."
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL')
conflicts=('goobook')
provides=('goobook')
depends=('python' 'python-simplejson' 'python-google-api-core'
         'python-google-api-python-client' 'python-googleapis-common-protos'
         'python-oauth2client' 'python-xdg>=4.0.1')
makedepends=('git' 'python-setuptools' 'python-docutils')
source=("git+https://gitlab.com/goobook/goobook.git")
md5sums=('SKIP')
install=goobook.install

pkgver() {
  cd "$_gitname"
  git describe --tags --always | sed 's|-|.|g'
}

package() {
  cd "$_gitname"
  python setup.py install --root="${pkgdir}" --optimize=1 || return 1
  rst2man.py --strict "$_gitname.1.rst" "$_gitname.1"
  install -Dm644 -Dt "$pkgdir/usr/share/man/man1" "$_gitname.1"
  install -Dm644 -Dt "$pkgdir/usr/share/doc/$_gitname" "README.rst" "CHANGES.rst"
}

# vim:set ts=2 sw=2 et:
