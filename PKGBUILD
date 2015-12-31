# Maintainer:  Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: max-k <max-k AT post DOT com>

pkgname=pear-http-request2
_pkgname=HTTP_Request2
pkgver=2.2.1
pkgrel=3
pkgdesc='Provides an easy way to perform HTTP requests.'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('BSD3')
depends=('php>=5.2.0' 'pear-net-url2>=2.0.0' 'php-pear>=1.9.2')
makedepends=()
options=('!strip')
install="${pkgname}.install"
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz
        pear-http-request2.install)
md5sums=('3549103543209ebbbd065f49e62d9eca'
         'bd7b8d4499b021db6d181faf3893c76b')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry/.chan*}
}

