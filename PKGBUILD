# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='python2-ethtool'
pkgname=('python-ethtool' 'python2-ethtool')
pkgver='0.13'
pkgrel='2'
pkgdesc='Python bindings for the ethtool kernel interface.'
arch=('any')
url="https://github.com/fedora-python/python-ethtool"
makedepends=('asciidoc' 'libnl'
		'python' 'python-setuptools'
		'python2' 'python2-setuptools')
license=('GPL')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('43211e1fd5654de21bbee4aeed6bc72c5147fdcb57eb8fd26234c889a9c4f9be')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  a2x -d manpage -f manpage "man/pethtool.8.asciidoc"
  a2x -d manpage -f manpage "man/pifconfig.8.asciidoc"
  gzip --stdout "man/pethtool.8" > "man/pethtool.8.gz"
  gzip --stdout "man/pifconfig.8" > "man/pifconfig.8.gz"
}

package_python-ethtool() {
  depends=('python' 'libnl')

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/man/man8"
  gzip --stdout "man/pethtool.8" > "${pkgdir}/usr/share/man/man8/pethtool.8.gz"
  gzip --stdout "man/pifconfig.8" > "${pkgdir}/usr/share/man/man8/pifconfig.8.gz"
}

package_python2-ethtool() {
  depends=('python2' 'libnl')

  cd "${srcdir}/python-ethtool-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/man/man8"
  gzip --stdout "man/pethtool.8" > "${pkgdir}/usr/share/man/man8/pethtool.8.gz"
  gzip --stdout "man/pifconfig.8" > "${pkgdir}/usr/share/man/man8/pifconfig.8.gz"
}
