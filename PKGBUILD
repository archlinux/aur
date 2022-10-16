# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin' 'ceph-mgr-bin')
pkgver=16.2.10
pkgrel=1
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
source=("ceph-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_linux_${arch}.tar.zstd"
        "ceph-libs-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_libs_linux_${arch}.tar.zstd"
        "ceph-mgr-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_mgr_linux_${arch}.tar.zstd")
sha512sums=('0ce0262c5dce397a9e13aceed696b38d657016b8782f68a0d266d2d3d2a46744c18bc1dd870f385b437f120776db0a3d6ce0c35a210247decf22a661943c84b0'
            'ee0a858f6dc862a300c75727cb517e36ff07afa611a21dba88bea5014cac46f1af54b751812e0f91d4476c2d7bd7ac7229e7863e9f6813b8b688f9bf28ac1070'
            '75dca4605cb1ee79531ccb1ebcf6c610361fec69bef1f40b6d47a940770c5c72a3f3a7e74daabd826cdd94f337bdb076d19021bb66602c117f1357bf94b71349')
# Don't extract source archives
noextract=("${source[@]%%::*}")


package_ceph-libs-bin() {
  depends=('boost-libs' 'curl' 'glibc' 'keyutils' 'libutil-linux' 'bzip2' 'lz4' 'nss'
           'oath-toolkit' 'python' 'snappy' 'systemd-libs' 'fmt' 'cryptsetup'
           'lua' 'librdkafka'
           'python-prettytable' 'python-yaml' 'python-setuptools')
  provides=("ceph-libs=${pkgver}-${pkgrel}")
  conflicts=('ceph-libs')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-libs-bin-${pkgver}.tar.zst -C "${pkgdir}"
}

package_ceph-bin() {
  depends=("ceph-libs=${pkgver}-${pkgrel}"
           'boost-libs' 'curl' 'fuse2' 'fuse3' 'fmt' 'glibc' 'gperftools' 'java-runtime'
           'keyutils' 'leveldb' 'libaio' 'libutil-linux' 'librdkafka' 'cryptsetup' 'libnl'
           'ncurses'
           'nss' 'oath-toolkit' 'python'
           'snappy' 'sudo' 'systemd-libs' 'lua' 'gawk'
           'xfsprogs')
  provides=("ceph=${pkgver}-${pkgrel}")
  conflicts=('ceph')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-bin-${pkgver}.tar.zst -C "${pkgdir}"
}

package_ceph-mgr-bin() {
  depends=("ceph=${pkgver}-${pkgrel}" "ceph-libs=${pkgver}-${pkgrel}"
           'bash' 'boost-libs' 'coffeescript' 'curl' 'gperftools' 'nodejs' 'nss' 'fmt'
           'python' 'python-cherrypy' 'python-pecan' 'python-pyjwt' 'python-more-itertools'
           'python-numpy' 'python-scipy' 'python-six' 'python-coverage' 'python-pytest' 'python-dateutil'
           'python-prettytable' 'python-requests' 'python-pyopenssl' 'python-bcrypt' 'python-yaml'
           'python-werkzeug' 'python-jinja')
  optdepends=('python-influxdb: influx module'
              'python-kubernetes: rook module'
              'python-prometheus_client: prometheus module'
              'python-remoto: ssh module')
  provides=("ceph-mgr=${pkgver}-${pkgrel}")
  conflicts=('ceph-mgr')
  options=('emptydirs' '!strip')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-mgr-bin-${pkgver}.tar.zst -C "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
