# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=mylar-git
pkgver=r1072.9c65a0d
pkgrel=1
pkgdesc="Comic book downloader for usenet and torrents"
arch=('i686' 'x86_64')
url="https://github.com/evilhero/mylar"
license=('GPL3')
depends=('python2')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy')

makedepends=('git')
provides=("mylar")
conflicts=("mylar")
options=(!strip)

source=('git://github.com/evilhero/mylar.git'
        'mylar.service'
        'mylar.tmpfiles'
        'mylar.sysusers')

sha256sums=('SKIP'
            '1d840481b2544003e10bc91e7958deabb2692249b251af7c606d025ab8477691'
            '8bd3e83b8fbfc781a44d37af7c2101d061e17cfe61c07e1d2cb75daecca708c8'
            '619a6266ad56e8363296b2ae7e2428c0f433f8c73a57d9bdf55ffba179f6c81d')

pkgver() {
  cd "${srcdir}/mylar"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/mylar"
  cp -dr --no-preserve='ownership' "${srcdir}/mylar/" "${pkgdir}/usr/lib/"
  rm -rf ${pkgdir}/usr/lib/mylar/.git
  rm -f ${pkgdir}/usr/lib/mylar/.gitignore

  install -D -m 644 "${srcdir}/mylar.service" "${pkgdir}/usr/lib/systemd/system/mylar.service"
  install -D -m 644 "${srcdir}/mylar.sysusers" "${pkgdir}/usr/lib/sysusers.d/mylar.conf"
  install -D -m 644 "${srcdir}/mylar.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mylar.conf"
}
