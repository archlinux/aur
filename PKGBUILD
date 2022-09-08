# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

pkgname='catt-git'
pkgver=0.12.9.r6.ge30fa5c
pkgrel=1
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
makedepends=(
  'git'
  'python-poetry'
  'python-setuptools'
)
source=("${pkgname%-*}::git+https://github.com/skorokithakis/catt.git")
sha256sums=('SKIP')
provides=("catt")
conflicts=("catt")

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  python -m poetry build --format wheel
}

package() {
  cd "${pkgname%-*}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
