# Maintainer : Frikilinux <frikilinux@gmail.com>
# Contributor : peeweep <peeweep at 0x0 dot ee>

pkgname=tidal-dl
pkgver=2022.1.18.2
pkgrel=2
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-lyricsgenius' 'python-pycryptodome' 
         'python-pydub' 'python-prettytable' 'python-setuptools' 'python-psutil'
         'python-importlib-metadata')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "apikey.patch")
sha256sums=('32135a688cf2d9c2abe55fc1ac5ca1a749a171eae1a8716742b8ab009e36aa00'
            '40a4fcc10c0b2fad0309cc6bb49ead03adacafe5944c8f5820be3be0cf02ab68')

prepare() {
  cd "${pkgname}-${pkgver}"
	patch -p1 -i "../apikey.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
