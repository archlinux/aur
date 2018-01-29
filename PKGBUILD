# Maintainer: Ian Douglas Scott <ian@iandouglasscott.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=wikicurses-git
pkgver=1.4.r1.gfc1c793
pkgrel=1
pkgdesc="A simple curses interface for accessing Wikipedia."
arch=('any')
url="https://github.com/ids1024/wikicurses"
license=('MIT')
makedepends=('git')
depends=('python' 'python-setuptools' 'python-urwid' 'python-beautifulsoup4' 'python-lxml')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/wikicurses.conf')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}"/${pkgname%-git}

  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/${pkgname%-git}

  python setup.py build
}

package() {
  cd "${srcdir}"/${pkgname%-git}

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
