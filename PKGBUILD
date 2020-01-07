# Maintainer: Blazej Sewera <blazejok1[at]wp.pl>

pkgname=wallsch-git
_pkgname=wallsch
pkgver=r26.3339716
pkgrel=1
pkgdesc="A simple wallpaper changer/scheduler with night/day split"
arch=('any')
url='https://github.com/jazzsewera/wallsch'
source=('git+https://github.com/jazzsewera/wallsch.git')
license=('custom:MPL2')
makedepends=('python-setuptools')
depends=('python' 'python-apscheduler' 'python-tzlocal' 'python-pyro' 'python-suntime')
optdepends=('feh: preferred wallpaper viewer'
            'i3lock: for screen locking support')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python3 setup.py build
}

package() {
  cd "${_pkgname}"
  python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm755 ./scripts/lockscreen "${pkgdir}/usr/bin"
  install -Dm755 ./scripts/set-wallpaper "${pkgdir}/usr/bin"
}
