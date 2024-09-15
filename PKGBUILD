# Maintainer: tejonaco <tejonaco@gmail.com>
# Maintainer: Artem Vasilev <artem.vasilev@rwth-aachen.de>
# Creator:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=podsync-latest-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Turn YouTube or Vimeo channels, users, or playlists into podcast feeds"
arch=('x86_64' 'i386' 'arm64' 'armv6')
url='https://github.com/mxpv/podsync'
license=('MIT')
provides=('podsync')
makedepends=('curl')


pkgver () {
        curl -s -X GET "https://api.github.com/repos/mxpv/podsync/releases" | jq '.[0].tag_name' -r | sed 's/^v//'
}

build () {
        file="${pkgname}-${pkgver}.tar.gz"
        file_url="$url/releases/download/v${pkgver}/Podsync_${pkgver}_Linux_${arch}.tar.gz"
        curl -o $file -L $file_url
        tar -xzf "$srcdir/$file"
}

package() {
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm755 podsync "${pkgdir}/usr/bin/podsync"
      }
