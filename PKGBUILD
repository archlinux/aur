# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Lucas Silva <lcdss@live.com>

pkgname=lbry-desktop-bin
pkgver=0.53.7
pkgrel=1
pkgdesc='Desktop app for the lbry-network (Odysee.com) - a decentralized, user-controlled content marketplace and YouTube alternative'
arch=('x86_64')
changelog=changelog.md
url="https://github.com/lbryio/${pkgname::-4}"
license=('MIT')
provides=("lbry=$pkgver" "$pkgname=$pkgver" "lbrynet=$pkgver")
depends=('nss' 'alsa-lib' 'gtk3')
replaces=('lbry-app-bin')
conflicts=('lbry' 'lbry-desktop' 'lbry-app-bin' 'lbrynet' 'lbrynet-bin' 'lbry-desktop-git')
depends=('libxtst' 'nss' 'alsa-lib' 'gtk3')
source=("$url/releases/download/v$pkgver/LBRY_$pkgver.deb"
#        "$url/releases/download/v$pkgver/LBRY_$pkgver.deb.asc"
        "https://raw.githubusercontent.com/lbryio/${pkgname::-4}/master/LICENSE")

# Not yet usable, as there are no individual signatures for the files. Feature was requested here
# https://github.com/lbryio/lbry-desktop/issues/7707

#validpgpkeys=('4A47DE443CEE6D70A892347A9B8FFF1D3E1C0A50')

b2sums=('6d4dd1726f785e4121d84e3c0e0cd59df112809c383eb90f838ab3c8d8c97e230616e947005c338398e2cd8d82b6b87d6506bfb9468c79f8a6f613139d1d1d2b'
#        'SKIP'
        'eadd07c9a4210b7d3b2408483433daca30100cdca4590379f376538d2c7cb300d77da3ffcd4950c279c7ecae729fbb2f5f6447c4a4fd8079ef979c54aaa21e42')

package() {
  install -dm 755 "$pkgdir/usr/bin/"
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
  ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
  cd "${srcdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
