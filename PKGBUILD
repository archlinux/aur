# Maintainer: Pedro Silva <psilva@pedrosilva.pt>
# Contributor: Martin -nexus- Mlynář <nexus+arch@smoula.net>

pkgname=btrfs-sxbackup
pkgver=0.6.11
pkgrel=1
pkgdesc="Incremental btrfs snapshot backups with push/pull support via SSH"
arch=('any')
url="https://github.com/masc3d/btrfs-sxbackup"
license=('GPL')

depends=('bash'
         'python'
	     'btrfs-progs'
	     'python-setuptools')
optdepends=('openssh: for remote push/pull'
            'lzop: compression support'
            'pv: progress indication'
            's-nail: email notifications')
provides=('btrfs-sxbackup')
conflicts=('python-btrfs-sxbackup')

install=${pkgname}.install

source=(https://github.com/masc3d/btrfs-sxbackup/archive/${pkgver}.tar.gz
        ${pkgname}@.service
        ${pkgname}@.timer)
sha512sums=('b57a0e564f25730f8cc16cd05685a7098d51b1d1617c50f89bdfcf2e7406b8d5b07604361a9751dad4d0c1522e04b913368397996c20c92a7a1fa4947506689f'
            '5337e640377944bf6c9bafceb7edec0b6052ca84212e0adbe9d44c997af6f582e581117e064a7fcc135041e7bb037d04920b2d3d7980a08ecf5c56fcf2525e58'
            'ec2ae5cf65c9727a8d91b9c8689f7c978d80bbe50a5ee65b24212c80319faaf784a18e98291796826d3a764fba2acef3ad44c05eaf5f9c6409a7818f2048b738')

package() {
  install -m0644 -D ${pkgname}@.service ${pkgdir}/usr/lib/systemd/system/${pkgname}@.service
  install -m0644 -D ${pkgname}@.timer ${pkgdir}/usr/lib/systemd/system/${pkgname}@.timer

  cd $srcdir/${pkgname}-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir
  install -m0644 -D etc/btrfs-sxbackup.conf $pkgdir/etc/btrfs-sxbackup.conf
}
