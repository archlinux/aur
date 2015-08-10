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
pkgver=2.3.4
pkgrel=1
pkgdesc="Puppetdb-terminus"
arch=("any")
url="http://puppetlabs.com/projects/puppetdb/"
license=("APACHE")
depends=("ruby" "facter" "puppet" )
options=(emptydirs)
conflicts=()
source=("http://downloads.puppetlabs.com/puppetdb/$_realpkgname-$pkgver.tar.gz"
        "build_defaults.yaml")
md5sums=('c3873bead77b62b9c2edffbaa886a090'
         'ddbe92f96248a11877877b168f56ae9a')

package () {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  # Fix package bootstrap on archlinux
  cp ${startdir}/build_defaults.yaml $srcdir/${_realpkgname}-${pkgver//_/-}/ext/build_defaults.yaml

  rake package:bootstrap 
  rake terminus PARAMS_FILE= DESTDIR=${pkgdir}

}
# vim: set ft=sh ts=2 sw=2 et:
