# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=automua
pkgver=2022.8.2
pkgrel=1
pkgdesc="Email client configuration made easy"
arch=('any')
license=('GPL3')
backup=('etc/automua/automua.conf')
url='https://github.com/HLFH/automua'
depends=('python')
source=('setupvenv.sh'
        'automua.sysusers'
        'automua.conf'
        'automua.service'
        'automua.tmpfiles')
b2sums=('a96f41433156756b650a9216ffe44a027b41d64b0fd37eac0e64297eadccb584925e0cefed38ba06d0129aefbd34a4c57559bfabfe43d36076373193e2ef6906'
        '9f5f26ee77c39c9988c60fbfa6ea0e492a00769bc8e827da88d149e78d919f2eff1ac160ff5af82deddeea03581dc150278564bdcf7401e42c337f4977a2ff07'
        '1ecda927911fe33f96c4a040593e190185b7c5450411c2b26ad4c35953c6d27813316bfff88fa3fcfd48c06fa1f2e4444f23a7ad8dff149a2661d404c28ea216'
        'e49984b707dab4553bbe9ba393e9ab7b53282faf0983dbbb9995bb1effc62939549174cd399de44f755576873c88184c072b3fbc1bd97ed3b110d452c9dae042'
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
