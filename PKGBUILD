# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Sin Kim <kimsin98@gmail.com>

_pkgname=datalad
pkgname=python-$_pkgname
pkgver=0.15.2
pkgrel=1
pkgdesc='Keep code, data, containers under control with git and git-annex '
arch=('any')
url='https://github.com/datalad/datalad'
license=('MIT')
depends=('python' 'git-annex' 'python-appdirs' 'python-chardet' 'python-distro' 'python-iso8601'
         'python-humanize' 'python-fasteners' 'patool' 'python-tqdm' 'python-wrapt'
         'python-annexremote' 'python-boto' 'python-keyring' 'python-keyrings-alt' 'python-msgpack'
         'python-requests' 'python-pygithub' 'python-gitlab' 'python-simplejson' 'python-whoosh')
makedepends=('python-setuptools')
optdepends=('python-argcomplete: optional CLI completion'
            'python-pyperclip: clipboard manipulations'
            'python-dateutil: support for more date formats'
            'python-yaml: metadata extra'
            'python-mutagen: audio metadata'
            'python-exifread: EXIF metadata'
            'python-xmp-toolkit: XMP metadata'
            'python-pillow: generic image metadata')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/datalad/${_pkgname}/archive/$pkgver.tar.gz")
sha512sums=('f0206855439c2d376172218ec6bf1ffa3277508256a5a49a2ec65a57bb5720e039481329c16459ed62eb1c9ed0126dc178ca34fa2c3b8dfdf8b8a0706a2b8658')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
