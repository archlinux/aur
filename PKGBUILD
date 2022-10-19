# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Sin Kim <kimsin98@gmail.com>

_pkgname=datalad
pkgname=python-$_pkgname
pkgver=0.17.7
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
sha512sums=('b01442bdd672e6ab0ebfe7fc71721437e117df0ddbe68558b8c21d4f5d387de807870250eac83630e52d2bb5ecf69686b5679c2a1458edb13b7e2a940c4e1330')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
