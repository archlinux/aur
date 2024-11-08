# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=smbclientng-git
_pkgname="${pkgname%-git}"
_upstream=smbclient-ng
pkgver=2.1.6.r5.g14531a1
pkgrel=1
pkgdesc="smbclient-ng, a fast and user friendly way to interact with SMB shares."
arch=('any')
url="https://github.com/p0dalirius/smbclient-ng"
license=(GPL-3.0-only)
depends=('python'
         'impacket'
         'python-charset-normalizer'
         'python-pefile'
         'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_upstream"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_upstream"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_upstream"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

