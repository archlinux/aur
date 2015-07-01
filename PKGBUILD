# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=python-grip-git
pkgver=3.2.0
pkgrel=1
pkgdesc="Preview GitHub Markdown files like Readme locally before committing them."
arch=('any')
url="https://github.com/joeyespo/grip"
license=('MIT')
depends=('python-requests' 'python-flask' 'python-docopt'
         'python-markdown' 'python-pygments' 'python-path-and-address')
makedepends=('python-setuptools' 'git')
source=("$pkgname::git://github.com/joeyespo/grip.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  grep -Po "(?<=version=').*(?=',)" setup.py | tr '\n' '.'
  # TODO use the git-revcount template here.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
