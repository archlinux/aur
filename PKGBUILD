# Puppetdb: Installer: Arch
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Original Maintainer: Niels Abspoel <aboe76 (at) Gmail (dot) com>

# RC style, reserved for later use
#pkgname=puppetdb
#_rc=8
#_pkgver=3.0.0
#pkgver=${_pkgver}_rc${_rc}

pkgname=puppetdb-terminus
_realpkgname=puppetdb
pkgver=2.3.8
pkgrel=1
pkgdesc='Puppetdb-terminus'
arch=('any')
url='http://puppetlabs.com/projects/puppetdb/'
license=('APACHE')
depends=('ruby' 'facter' 'puppet' )
makedepends=('git')
options=(emptydirs)
conflicts=()
validpgpkeys=('47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30')
source=("http://downloads.puppetlabs.com/puppetdb/$_realpkgname-$pkgver.tar.gz"{,.asc}
        'build_defaults.yaml')
sha512sums=('06133934c1496693ab239b1fdf17b8bc292f746efc08741d0172e7889d2b9908f8142777bda415c2ade9f65f58c5573abb35db5cbf15b22ad70a56d4233159fd'
            '98012de764dd1fc31fa682c261e10659ff5383eb6b8a8620f2c6837438a3a34f6b7dc9b1aed7b5cafebc56932f70dac9ae6fef1d7076aa8fd1e8849971ce2f7f'
            'adee2b426f943573b004a62c488950a87c16bc2c44fd786f8bc8e6fefc30355d078a41494570bf34c6b9c6d6124499ffa29c511b611ff562b45586b6f670438f')
package () {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  # Fix package bootstrap on archlinux
  cp ${startdir}/build_defaults.yaml $srcdir/${_realpkgname}-${pkgver//_/-}/ext/build_defaults.yaml

  rake package:bootstrap 
  rake terminus PARAMS_FILE= DESTDIR=${pkgdir}

}
# vim: set ft=sh ts=2 sw=2 et:
