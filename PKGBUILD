# Originaly author: Danial Behzadi <dani.behzi@ubuntu.com>
# Maintainer: Mobin Aydinfar <mobin at mobintestserver dot ir>

major=4.1.1
minor=~202301121304
ubuntu_ver=~ubuntu23.04.1

pkgname=tractor
pkgver=${major}_${minor}
pkgrel=1
pkgdesc="Setup an onion routing proxy (Stable release. Based on ubuntu package)"
arch=(any)
url="https://framagit.org/tractor/tractor/"
license=(GPLv3)
makedepends=('wget')
depends=('python' 'python-gobject' 'tor')

source=(https://launchpad.net/~tractor-team/+archive/ubuntu/tractor/+files/tractor_${major}${minor}${ubuntu_ver}_all.deb)
sha256sums=('0d216e712897d834353257a158eb3bf841073c8a0578fff4d94c1a7e243ec4db')

move_copyright() {
    find ${pkgdir}/usr/share/doc -name "changelog.Debian.gz" -delete
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    find ${pkgdir}/usr/share/doc -name "copyright" -exec mv {} ${pkgdir}/usr/share/licenses/${pkgname} \;
    find ${pkgdir}/usr/share/doc -type d -empty -delete
}

package() {
  tar -C "${pkgdir}" -xf "${srcdir}"/data.tar.zst
  move_copyright
}
