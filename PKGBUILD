# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin' 'ceph-mgr-bin')
pkgver=15.2.14
pkgrel=7
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
source=("ceph-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_linux_${arch}.tar.zstd"
        "ceph-libs-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_libs_linux_${arch}.tar.zstd"
        "ceph-mgr-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_mgr_linux_${arch}.tar.zstd")
sha512sums=('d8ed4d19f3638a18e16cadabf7a6eaab32bb37c5700fbd4559aa226e3406fc528a79c699de75ff29deb2c50b0c027261b9e671958674a16f96674deb6411a8b5'
            'e0ee00643cd6f5d829a0ab2bddc4d52aa98db915e9c25020e4aefb731aceae154f0793694e7257b005c5a8e7a1d3c5b1c51d081e560981d36417a0e999fdc920'
            'f07c64fdde6b99ab3849eefcdf1099058874c49d2a5cb530a9857347f4be76f77fff6a0df3bc7c83339b8c643797861548a69b35067d9d9081996fef71dac1b4')
# Don't extract source archives
noextract=("${source[@]%%::*}")


package_ceph-libs-bin() {
  depends=('boost-libs' 'curl' 'glibc' 'keyutils' 'libutil-linux' 'bzip2' 'lz4' 'nss'
           'oath-toolkit' 'python' 'snappy' 'systemd-libs' 'fmt')
  provides=('ceph-libs')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-libs-bin-${pkgver}.tar.zst -C "${pkgdir}"
}

package_ceph-bin() {
  depends=("ceph-libs=${pkgver}-${pkgrel}"
           'boost-libs' 'curl' 'fuse2' 'fuse3' 'fmt' 'glibc' 'gperftools' 'java-runtime'
           'keyutils' 'leveldb' 'libaio' 'libutil-linux' 'librdkafka'
           'lsb-release' 'ncurses'
           'nss' 'oath-toolkit' 'python' 'python-bcrypt' 'python-setuptools'
           'python-prettytable' 'python-cmd2' 'python-dateutil' 'snappy' 'sudo' 'systemd-libs'
           'python-flask' 'python-pecan' 'python-pyopenssl' 'python-requests' 'python-werkzeug' 'xfsprogs'
           'python-yaml' 'python-pyaml')
  provides=('ceph')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-bin-${pkgver}.tar.zst -C "${pkgdir}"
}

package_ceph-mgr-bin() {
  depends=("ceph=${pkgver}-${pkgrel}" "ceph-libs=${pkgver}-${pkgrel}"
           'bash' 'boost-libs' 'coffeescript' 'curl' 'gperftools' 'nodejs' 'nss'
           'python' 'python-cherrypy' 'python-flask-restful' 'python-pecan'
           'python-pyjwt' 'python-routes' 'python-jsonpatch' 'python-more-itertools' 'python-numpy'
           'python-scipy' 'python-six')
  optdepends=('python-influxdb: influx module'
              'python-kubernetes: rook module'
              'python-prometheus_client: prometheus module'
              'python-remoto: ssh module')
  provides=('ceph-mgr')
  conflicts=('ceph<14.2.1-1')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-mgr-bin-${pkgver}.tar.zst -C "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
