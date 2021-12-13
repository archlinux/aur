# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=linuxprivchecker-git
_name="${pkgname%-git}"

pkgver() {
  cd "$_name"
  printf r%s.%s "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r37.0d70108
pkgrel=2

pkgdesc='A Linux privilege escalation check script'
arch=('any')
url="https://github.com/sleventyeleven/$_name"
license=('custom')

makedepends=('git' 'python-setuptools')
depends=('python')

provides=("$_name")
conflicts=("$_name")

source=("git+$url.git")
sha256sums=('SKIP')


build() {
  cd "$_name"
  python setup.py build
}

package() {
  cd "$_name"
  PYTHONHASHSEED=0 python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE   -t"$pkgdir/usr/share/licenses/$_name/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
