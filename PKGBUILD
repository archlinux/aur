# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Sin Kim <kimsin98@gmail.com>

_pkgname=datalad
pkgname=python-$_pkgname
pkgver=0.17.1
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
sha512sums=('4ef14a4651ca6eb753e21eb5cf764f3b2df80df8756d93b3c36dac95b98bc7cad8324ad55741d6fbfee471b093f814fb55880ff8c385fa18a67b03cc91a666ea')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
