# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Jakub Fišer <kubaCURLYSYMBOLufiseruSMALLPOINTSYMBOlcz>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=vit-git
pkgver=r629.1e1d010
pkgrel=1
pkgdesc="Visual Interactive Taskwarrior full-screen terminal interface (GIT version)"
arch=('any')
url='https://github.com/vit-project/vit'
license=('MIT')
conflicts=('vit')
provides=('vit')
depends=('python'
         'python-pytz'
         'python-tasklib'
         'python-tzlocal'
         'python-urwid'
         'task')
makedepends=('git'
             'python-setuptools')
source=(git+https://github.com/vit-project/vit.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  python setup.py build
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
