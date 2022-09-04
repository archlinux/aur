# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=python-regex-git
pkgver=387.bf5e239
pkgrel=1
pkgdesc="Alternative regular expression module, to replace re."
arch=('i686' 'x86_64')
url="https://bitbucket.org/mrabarnett/mrab-regex"
license=('custom')
depends=('python')
makedepends=('git' 'python-setuptools')
_gitname='mrab-regex'
source=("git+https://bitbucket.org/mrabarnett/$_gitname")
md5sums=('SKIP')
provides=(python-regex)
conflicts=(python-regex)


pkgver() {
  cd ${_gitname}
  echo "$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

build() {
  cd ${_gitname}
  python setup.py build
}

package() {
  cd ${_gitname}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  sed -n '1,/^$/p' regex_3/regex.py | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
