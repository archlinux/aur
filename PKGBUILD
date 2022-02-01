# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

pkgname='catt-git'
_pkgname=catt
pkgver=0.12.5.r7.g79d8e5a
pkgrel=2
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
arch=('any')
url="https://github.com/skorokithakis/catt"
license=('BSD')
depends=(
  'python'
  'python-click'
  'python-ifaddr'
  'python-netifaces'
  'python-pychromecast>=7.5.0'
  'python-requests'
  'youtube-dl>=2020.06.06')
makedepends=('git' 'python-dephell' 'python-setuptools')
source=("${pkgname%-*}::git+https://github.com/skorokithakis/catt.git")
sha256sums=('SKIP')
provides=("catt")
conflicts=("catt")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/"${pkgname}"/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
