# Maintainer: Henry78 <henry78@gmx.at>
# Mainteiner: Donald Webster <fryfrog@gmail.com>

pkgname=runrestic
pkgver=0.3.2
pkgrel=1
pkgdesc='A wrapper script for Restic backup software that inits, creates, prunes and checks backups'
arch=(any)
url='https://github.com/andreasnuesslein/runrestic'
license=('GPL3')
depends=('python'
         'python-toml'
         'python-jsonschema')

source=("runrestic-${pkgver}.tar.gz::https://github.com/andreasnuesslein/runrestic/archive/${pkgver}.tar.gz")

sha256sums=('23e336eb1c896bb05ea39075a6ba1943173a8a58837014cb531ef47d7143702f')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  sed -i 's%/usr/local%/usr%' sample/systemd/runrestic.service
  install -D -m 644 sample/systemd/runrestic.service ${pkgdir}/usr/lib/systemd/system/runrestic.service
  install -D -m 644 sample/systemd/runrestic.timer   ${pkgdir}/usr/lib/systemd/system/runrestic.timer
}
