# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=jangouts
pkgver=0.5.0
pkgrel=1
pkgdesc='Videoconferencing based on WebRTC and Janus Gateway with an UI inspired by Google Hangouts'
url='https://github.com/jangouts/jangouts'
arch=('any')
license=('custom')
depends=('janus-gateway')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('25905950eb9b47f0f743078de69341d4ce0c59bdbd3a5e6b150baf39f7af5c59')
options=('!strip')
backup=("etc/$pkgname/config.json"
        "etc/$pkgname/config.callstats.json")

prepare() {
  cd "${srcdir}/jangouts-$pkgver"
}

package() {
  cd "${srcdir}/jangouts-$pkgver"
  install -dm 755 "$pkgdir"/usr/share/{webapps,doc,licenses}"/$pkgname"
  install -dm 755 "$pkgdir"/etc"/$pkgname"
  cp -R dist/* "$pkgdir/usr/share/webapps/$pkgname"
  cp dist/config{,.callstats}.json "$pkgdir/etc/$pkgname"
  ln -sf "/etc/$pkgname/config.json" "$pkgdir/usr/share/webapps/$pkgname/config.json"
  ln -sf "/etc/$pkgname/config.callstats.json" "$pkgdir/usr/share/webapps/$pkgname/config.callstats.json"

  install -Dm644 README.md TROUBLES.md "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.txt LICENSE-artwork.txt "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
