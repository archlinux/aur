# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=mssqlrelay-git
_pkgname="${pkgname%-git}"
pkgver=r10.97efa52
pkgrel=1
pkgdesc="Microsoft SQL Relay is an offensive tool for auditing and abusing Microsoft SQL (MSSQL) services."
arch=('any')
url="https://github.com/CompassSecurity/mssqlrelay"
license=(MIT)
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('mssqlrelay')
conflicts=('mssqlrelay' 'mssqlrelay-bin')
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

