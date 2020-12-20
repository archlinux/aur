# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=tautulli
pkgver=2.6.3
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/Tautulli/Tautulli"
license=('GPL')
makedepends=('curl')
depends=('python' 'python-setuptools' 'python-pytz')
conflicts=('plexpy-git' 'tautulli-beta' 'plexpy')
provides=("tautulli")
replaces=("plexpy")
install='tautulli.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tautulli/Tautulli/archive/v$pkgver.tar.gz"
        'tautulli.tmpfiles'
        'tautulli.service'
        'tautulli.sysusers')

sha256sums=('298c2c3c2ff22109130007cd2ae86ff5064d8f0c47469b94bafc0861a108f025'
            'a054b8abfabb44d35a97642050286751f77d22e22f3d00077960b370051aa4f4'
            '8363c0de54806e43e59cfde564ff57a49883895cfc0e725282889658a224624a'
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
