# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Sin Kim <kimsin98@gmail.com>

_pkgname=datalad
pkgname=python-$_pkgname
pkgver=0.17.2
pkgrel=1
pkgdesc='Keep code, data, containers under control with git and git-annex'
arch=('any')
url='https://github.com/datalad/datalad'
license=('MIT')
depends=('python' 'git-annex'
         'python-platformdirs' 'python-chardet' 'python-distro' 'python-iso8601' 'python-humanize'
         'python-fasteners' 'python-packaging' 'patool' 'python-tqdm' 'python-annexremote'
         'python-boto' 'python-keyring' 'python-keyrings-alt' 'python-msgpack' 'python-requests'
         'python-gitlab'
         'python-simplejson' 'python-whoosh')
makedepends=('python-setuptools')
optdepends=('python-requests-ftp: extra downloaders'
            'python-argcomplete: optional CLI completion'
            'python-pyperclip: clipboard manipulations'
            'python-dateutil: support for more date formats'
            'python-yaml: extra metadata'
            'python-mutagen: audio metadata'
            'python-exifread: EXIF metadata'
            'python-xmp-toolkit: XMP metadata'
            'python-pillow: generic image metadata')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/datalad/${_pkgname}/archive/$pkgver.tar.gz")
sha512sums=('7eceaea6bd0f0e251f194d8c1846e5abfff46174c536a42c1c0f891ca06f9688f8d291dec706f4ca51128d6588ceaf28039d80e63ebc5a15417bca3c74f0d866')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
