# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sanoid
pkgver=1.4.18
pkgrel=1
pkgdesc="Sanoid is a policy-driven snapshot management tool for ZFS filesystems."
arch=('any')
url='https://github.com/jimsalterjrs/sanoid'
license=('GPL')
backup=('etc/sanoid/sanoid.conf')
depends=('perl' 'perl-config-inifiles')
optdepends=('pv: progress bars'
            'lzop: compression'
            'mbuffer: stream buffering')
conflicts=('sanoid-git')
provides=('sanoid')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jimsalterjrs/sanoid/archive/v$pkgver.tar.gz"
        'sanoid.service'
        'sanoid.timer')

sha256sums=('42e6ba2f8fc5ebf4ca6c4c7ea71dc68756891ba2a81111d49ca0304c532b1dfa'
            'a1f53363c2814a797ed4b19533b31db87e36bf9ffd41487c036570e80f498f76'
            '69f216772f852e2f7ed90633799d2ad8fa04cb0166c2e54eddcf6654047a4beb')

package() {
  cd "${pkgname}-${pkgver}"

  # Documents
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sanoid/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/sanoid/LICENSE"

  # Configs
  install -Dm644 sanoid.conf "${pkgdir}/etc/sanoid/sanoid.conf"
  install -Dm644 sanoid.defaults.conf "${pkgdir}/etc/sanoid/sanoid.defaults.conf"

  # Binaries
  install -Dm755 sanoid "${pkgdir}/usr/bin/sanoid"
  install -Dm755 syncoid "${pkgdir}/usr/bin/syncoid"
  install -Dm755 findoid "${pkgdir}/usr/bin/findoid"

  # systemd
  install -D -m 644 "${srcdir}/sanoid.timer" "${pkgdir}/usr/lib/systemd/system/sanoid.timer"
  install -D -m 644 "${srcdir}/sanoid.service" "${pkgdir}/usr/lib/systemd/system/sanoid.service"
}
