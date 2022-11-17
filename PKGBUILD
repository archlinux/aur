# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=automua
pkgver=2022.8.1
pkgrel=1
pkgdesc="Email client configuration made easy"
arch=('any')
license=('GPL3')
backup=('etc/automua/automua.conf')
url='https://github.com/HLFH/automua'
depends=('python39')
source=('setupvenv.sh'
        'automua.sysusers'
        'automua.conf'
        'automua.service'
        'automua.tmpfiles')
b2sums=('ae12da0427d370e4252a01f393f203620cc11c23204be2bdb5e04b4e28960a4b00534bf3e46b5f1577ec2a9ea7536ae3535808c6a56bd29bdf0b7608dc70e437'
        '9f5f26ee77c39c9988c60fbfa6ea0e492a00769bc8e827da88d149e78d919f2eff1ac160ff5af82deddeea03581dc150278564bdcf7401e42c337f4977a2ff07'
        '1ecda927911fe33f96c4a040593e190185b7c5450411c2b26ad4c35953c6d27813316bfff88fa3fcfd48c06fa1f2e4444f23a7ad8dff149a2661d404c28ea216'
        '18c3d733555e4aaf47ebb3e4681050c5792ccfd395f22de1e58a5f0ca36df1b3e7e22700d4f00b5f22066aa6e806b0dd3acfae7f68dc7daa1a26cf96f43d317b'
        '5093bc61755faf1641cd99a605e65f84e349bb4870e0822540f2357260bdae11242e8e987be2cc6b55fdee1984ec00cac8f6bff8b44676f929a19823cb5d2d9f')

package() {
  mkdir -p "$pkgdir/etc/automua"
  mkdir -p "$pkgdir/srv/http/automua"
  cd "$pkgdir/srv/http/automua"
  install -Dm644 "${srcdir}/setupvenv.sh" "setupvenv.sh"
  sh setupvenv.sh
  source .venv/bin/activate
  pip install -Iv $pkgname==$pkgver
  install -Dm644 "${srcdir}/automua.sysusers" "${pkgdir}/usr/lib/sysusers.d/automua.conf"
  install -Dm644 "${srcdir}/automua.conf" "${pkgdir}/etc/automua/automua.conf"
  install -Dm644 "${srcdir}/automua.service" "${pkgdir}/usr/lib/systemd/system/automua.service"
  install -Dm644 "${srcdir}/automua.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/automua.conf"
}
