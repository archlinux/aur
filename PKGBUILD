# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin' 'ceph-mgr-bin')
pkgver=15.2.14
pkgrel=9
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
source=("ceph-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_linux_${arch}.tar.zstd"
        "ceph-libs-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_libs_linux_${arch}.tar.zstd"
        "ceph-mgr-bin-${pkgver}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_mgr_linux_${arch}.tar.zstd")
sha512sums=('e81d6e71299ce30b65c89b755989ecd0aed9f922b62b4f202586722645498591e79e72e5de2c99bbc881c5bb1a0ed857c7a96aefaddc339f345a9cc82e7686df'
            'b9475a85f3f2c9f48b95d4169c7169e12f1bfa1e9bf5a3e027d8587b117355065cd0bf3503ff98363bd65e42e86ec5e2594a3a32e2950e02a11e77864b144b33'
            'f0388a44afb2f86b91dd9b199147ad558f4d823091abca4375ac9671c3a38c84fc284b7e6c3b07197440611b49f0f24f24ded0ef048eefa73087002705c1d47f')
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
