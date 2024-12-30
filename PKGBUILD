# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=coercer-git
_pkgname="${pkgname%-git}"
pkgver=2.4.3.r16.g1fd071d
pkgrel=1
pkgdesc="Python script to automatically coerce a Windows server to authenticate on an arbitrary machine through 12 methods."
arch=('any')
url="https://github.com/p0dalirius/coercer"
license=(GPL-2.0-only)
depends=('impacket'
         'python'
         'python-jinja'
         'python-sectools'
         'python-netifaces'
         'python-xlsxwriter')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
