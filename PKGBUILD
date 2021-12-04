# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Sin Kim <kimsin98@gmail.com>

_pkgname=datalad
pkgname=python-$_pkgname
pkgver=0.15.3
pkgrel=1
pkgdesc='Keep code, data, containers under control with git and git-annex'
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
sha512sums=('728d1951aca8aa642b20f643097304c0a9a6ec94b6af19780f664cf7f24441f6748dd5142c10965963ab8af1d1c04854199c38804429cb0d7499aae2a9e7607a')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
