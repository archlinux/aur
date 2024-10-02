# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=iptvorg-epg
pkgver=2023.12.1
pkgrel=7
pkgdesc='Utilities for downloading the EPG (Electronic Program Guide) for thousands of TV channels from hundreds of sources'
arch=('any')
url='https://github.com/iptv-org/epg'
license=('Unlicense')
depends=('bash' 'libxml2' 'nodejs')
makedepends=('npm' 'nodejs-lts-iron')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iptv-org/epg/archive/refs/tags/${pkgver}.tar.gz"
        'iptvorg-epg.sh'
        'my.channels.xml')
sha256sums=('21a6654911daf24d7ed6abf8e2fcb1c7331b3cce64053a96faead3fbe98e9fb3'
            'd7825b36a9e642d7695ec941a440675240a60959a7d118ec366bf17a0b30dd7e'
            '26e87976d170c78e458ac44e65d305374aef67d2ab44a17bce151e86a2b783e5')

build() {
  npm i --cache "$srcdir/npm-cache" --prefix epg-$pkgver
  bsdtar -a -cf epg-$pkgver.tgz epg-$pkgver
}

package() {
  # Install npm application
  install -d "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/bin"
  install -Dm644 epg-$pkgver.tgz "$pkgdir/usr/share/$pkgname"
  # Install executable
  install -Dm755 iptvorg-epg.sh "$pkgdir/usr/bin/iptvorg-epg"
  # Install example custom-channels-xml file
  install -Dm644 my.channels.xml "$pkgdir/usr/share/$pkgname/my.channels.xml"
}

# vim:set ts=2 sw=2 et:
