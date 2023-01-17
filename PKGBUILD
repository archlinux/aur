# Maintainer: Dashon Wells <me@me.me>
# Contributor Michael Riegert <michael at eowyn net>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname='catt'
pkgver=0.12.9
pkgrel=2
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
arch=('any')
url=https://github.com/skorokithakis/"${pkgname}"
license=('BSD')

depends=(
  'python-click'
  'python-importlib-metadata'
  'python-pychromecast>=7.5.0'
  'yt-dlp')

makedepends=('python-setuptools')

source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5aab8745872e2ed57602ce3d045da08741fdf08c319d6280cf8da07ae216872d')

build(){
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
