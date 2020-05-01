# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=tautulli
pkgver=2.2.3
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/Tautulli/Tautulli"
license=('GPL')
makedepends=('curl')
depends=('python2' 'python2-setuptools' 'python2-pytz')
conflicts=('plexpy-git' 'tautulli-beta' 'plexpy')
provides=("tautulli")
replaces=("plexpy")
install='tautulli.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tautulli/Tautulli/archive/v$pkgver.tar.gz"
        'tautulli.tmpfiles'
        'tautulli.service'
        'tautulli.sysusers')

sha256sums=('d0be342db6c26b13a5479b3d6ca80419a179b9143fa198668b8a1ac038594a0a'
            'a054b8abfabb44d35a97642050286751f77d22e22f3d00077960b370051aa4f4'
            '3b7d165e39844dc5ffb126999e16d52b47acb2858d752ffe100a86e65648be38'
            'e6bb046d1022f0d2623f42c092f993c395a938a1f2a16c2986e76506bbfb54f8')

package() {
  cd "${srcdir}/Tautulli-${pkgver}"

  # To get rid of the unknown version
  echo "v$pkgver" > version.txt
  install -D -m 644 version.txt "${pkgdir}/usr/lib/tautulli/version.txt"

  install -D -m 755 PlexPy.py "${pkgdir}/usr/lib/tautulli/PlexPy.py"
  install -D -m 755 Tautulli.py "${pkgdir}/usr/lib/tautulli/Tautulli.py"
  install -D -m 644 pylintrc  "${pkgdir}/usr/lib/tautulli/"
  install -D -m 644 CHANGELOG.md "${pkgdir}/usr/lib/tautulli/"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/tautulli/LICENSE"

  cp -a data/ lib/ plexpy/ "${pkgdir}/usr/lib/tautulli/"

  install -D -m 644 "${srcdir}/tautulli.service" "${pkgdir}/usr/lib/systemd/system/tautulli.service"
  install -D -m 644 "${srcdir}/tautulli.sysusers" "${pkgdir}/usr/lib/sysusers.d/tautulli.conf"
  install -D -m 644 "${srcdir}/tautulli.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/tautulli.conf"
}
