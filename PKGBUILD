# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgbase=python-kivymd-git
pkgname=('python-kivymd-git' 'python2-kivymd-git')
pkgdesc="Set of widgets for Kivy inspired by Google's Material Design."
pkgver=r361.a7d384a
pkgrel=1
arch=('any')
url="https://gitlab.com/kivymd/KivyMD/"
license=('MIT')
source=("$pkgname::git+https://gitlab.com/kivymd/KivyMD")
conflicts=('python-kivymd')
makedepends=('python-setuptools' 'python2-setuptools')
md5sums=('SKIP')

prepare() {
  cp -a python-kivymd-git python2-kivymd-git
}

pkgver(){
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python2-kivymd-git() {
  depends=('python2-kivy')
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-kivymd-git() {
  depends=('python-kivy')
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
