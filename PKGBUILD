# Maintainer: kXuan <kxuanobj at gmail dot com>
# Contribuor: Peter Cai <peter at typeblog dot net>

pkgname=netease-cloud-music
pkgver=1.2.1
_pkgdate=20190428
pkgrel=4
pkgdesc="Netease Cloud Music, converted from .deb package"
arch=("x86_64")
url="https://music.163.com/"
license=('custom')
depends=('gtk2' 'gtk3' 'vlc')
source=(
	"https://d1.music.126.net/dmusic/netease-cloud-music_${pkgver}_amd64_ubuntu_${_pkgdate}.deb"
	"https://music.163.com/html/web2/service.html"
    "exclude.list"
)
sha256sums=('1ee9f02842e6c2c8c79c48b2e932074f9c213a8eb4238e5e63f20438562fecbb'
            'cf307fee4be224223ed8cf5af5e8708960683564cd05c53108fa3c382c029a0e'
            'SKIP')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  cd ${srcdir}
  tar -xf data.tar.xz -C ${pkgdir} --exclude-from=exclude.list
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
