# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=certi-git
_pkgname="${pkgname%-git}"
pkgver=r6.6cfa656
pkgrel=2
pkgdesc="Active Directory Certificate Services (ADCS) abuser. impacket copy of Certify."
arch=('any')
url="https://github.com/zer1t0/certi"
license=(AGPL-3.0-only)
depends=('python'
         'python-cryptography'
         'impacket')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# https://wiki.archlinux.org/title/Python_package_guidelines#setuptools_or_distutils
build() {
  cd "$_pkgname"

  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
