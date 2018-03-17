# Maintainer: Kohei Nagasu <kohei at lcarsnet dot pgw dot jp>

pkgname='backup_btrfs'
pkgver='1.0_0'
pkgrel=1
pkgdesc='Backup tools for environment using Btrfs.'
arch=('any')
url="https://github.com/nagasuk/backup_btrfs"
license=('GPL3')
depends=('bash' 'btrfs-progs' 'inotify-tools')
backup=('etc/backup_btrfs.conf')
install='backup_btrfs.install'
source=("https://github.com/nagasuk/${pkgname}/archive/release-${pkgver}.tar.gz"
        'backup_btrfs.conf'
        'backup_btrfs@.service'
        'backup_btrfs@.timer'
        'backup_btrfsd.service')

sha256sums=('f0bcf36778b0f17345cc4dd2b58be841c62aacfdb661c1fe779298d68f06ebd6'
            'e65a1ace874ec9c70a3e2b79201e3d0ed2e962ffc0476f499068585e1e08d760'
            '6e6466380fb4b0b4fa2d299b4ffb44be482f0eacd9f4aba969aae80208bf7c14'
            'b9b6bb3fe49a59d48452d5864a79975d31a867e7792dcb8744b8f7b35909887a'
            'c15e994ef81d0f24b5e87ea8784b6c0d58058ebf4a3ebe02e86882bb60694b63')

package()
{
  mkdir -m 755    "${pkgdir}/etc"
  mkdir -m 755 -p "${pkgdir}/usr/"{'bin','lib/systemd/system'}

  cp -r "${srcdir}/${pkgname}-release-${pkgver}/"{*'.sh','libbackup_btrfs.d'} "${pkgdir}/usr/bin/"
  cp "${srcdir}/"*'.'{'service','timer'} "${pkgdir}/usr/lib/systemd/system/"
  cp "${srcdir}/backup_btrfs.conf" "${pkgdir}/etc/"
}

# vim:set ts=2 sw=2 et:
