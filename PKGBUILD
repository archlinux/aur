# Maintainer: Robert Olejnik <arch [at] nxt.cx>

pkgname=pw-sat2-gs
pkgsrc=pw-sat-gs
pkgver="1.10"
pkgrel="2"
pkgdesc="Application dedicated to HAM amateur radios allowing for PW-Sat2 satellite frames collection and upload to webapp"
arch=('x86_64')
url="http://www.pw-sat.pl"
license=('AGPL3')
depends=('glibc' 'binutils')
source=('pw-sat-gs.desktop' 'pw-sat-gs.png')
sha256sums=('5f326e98fa0ffeef3c4dc1b5b838981f60251f89d8e1a2a91575ba356f2d3b6f'
            'b3aafd8783dfb735d636e13344577d3a87e47f431e1fa4f2d583aeee7a76b8c5')

source_x86_64=(https://github.com/PW-Sat2/HAM-desktop-application/releases/download/$pkgver/$pkgsrc-linux-64-bit-v$pkgver.zip)
md5sums_x86_64=('b396a5300eac563b4df0f17fc59bf787')

package() {
  cd "$pkgdir"

  install -dm0755 opt usr/bin usr/share/applications/ usr/share/pixmaps/

  cp -ar "$srcdir"/$pkgname opt/

  ln -sf /opt/$pkgname/PW-Sat2_Ground_Station usr/bin/$pkgname

  install -Dm644 "$srcdir"/pw-sat-gs.desktop "$pkgdir"/usr/share/applications/pw-sat-gs.desktop
  install -Dm644 "$srcdir"/pw-sat-gs.png "$pkgdir"/usr/share/pixmaps/pw-sat-gs.png

  # TODO: TOFIX:
  # Right now the app just writes logs to /opt/$pkgname/...
  chmod 777 opt/$pkgname/main/logs/

}

