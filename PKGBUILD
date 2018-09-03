# Maintainer: Daniel Moch <daniel@danielmoch.com>
_name=nncli
pkgname=nncli-git
pkgver=v0.2.0.r0.g4a23f7b
pkgrel=1
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://github.com/djmoch/${_name}"
provides=('nncli')
conflicts=('nncli')
license=('MIT')
depends=('python' 'python-urwid' 'python-requests' 'python-appdirs')
makedepends=('flit' 'git' 'python-pip' 'sed' 'grep')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${srcdir}/${_name}"
  flit build
}

package()
{
  cd "${srcdir}/${_name}"
  _ver=$(echo ${pkgver} | grep -Eo '[0-9]+\.[0-9]+\.[0-9]')
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${_name}-${_ver}-py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
