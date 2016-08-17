# Maintainer: Adrian Sampson <adrian@radbox.org>
# Contributor: Johannes Löthberg <demizide@gmail.com>

pkgname=beets-git
pkgver=1.3.11.r31.ga0ff517
pkgrel=1
pkgdesc="Flexible music library manager and tagger - git version"
arch=('any')
url="http://beets.io/"
license=('MIT')
depends=('python-munkres' 'mutagen'
         'python-setuptools' 'python-unidecode'
         'python-musicbrainzngs' 'python-yaml'
         'python-enum34' 'python-jellyfish'
         'python-six')
makedepends=('git')
optdepends=('python-pyacoustid: acoustic fingerprinting'
            'python-flask: web interface'
            'python-gobject: BPD audio player plugin'
            'python-pylast: lastgenre plugin')
provides=('beets' 'beets-git')
conflicts=('beets' 'beets-git')
source=('git://github.com/beetbox/beets.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/beets
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/beets
  python setup.py build
}

package() {
  cd ${srcdir}/beets
  python setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
