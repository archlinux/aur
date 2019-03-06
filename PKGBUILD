# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_name='python-ethtool'
pkgname='python2-ethtool'
pkgver='0.14'
pkgrel='2'
pkgdesc='Python bindings for the ethtool kernel interface.'
arch=('x86_64')
url="https://github.com/fedora-python/${_name}"
license=('GPL')
depends=('python2' 'libnl')
makedepends=('asciidoc' 'python2-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('27799b729aad0b65edfb2dd480dd433117bbee1cba0bdea467b7d2a6600a69e9')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py build
  a2x -d manpage -f manpage "man/pethtool.8.asciidoc"
  a2x -d manpage -f manpage "man/pifconfig.8.asciidoc"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install -O1 --skip-build --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/man/man8"
  gzip --stdout "man/pethtool.8" > "${pkgdir}/usr/share/man/man8/pethtool.8.gz"
  gzip --stdout "man/pifconfig.8" > "${pkgdir}/usr/share/man/man8/pifconfig.8.gz"
}
