# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
pkgname=pq-cli
pkgver=1.0.2
pkgrel=5
pkgdesc="Progress Quest: the CLI edition"
arch=('any')
url="https://github.com/rr-/pq-cli"
license=('MIT')
depends=('python'
         'python-urwid'
         'python-urwid_readline'
         'python-xdg-base-dirs')

makedepends=('python-poetry' 'git')

_COMMIT="7790e52a6d3c0f6fbaf45f581f0fb98f78247af6"
source=(${pkgname}::"git+https://github.com/rr-/pq-cli.git#commit=${_COMMIT}")
sha512sums=('1db75f0579fda830b27e4d838b1263dd1c4ace09f85155502aa815e90deb8de6547038cd993f529874abba3ef241d6370468e104a7ef3913fd609a46c21c6c8a')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: sw=2 ts=2 tw=80 et:
