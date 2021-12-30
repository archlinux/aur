# Maintainer: Kevin J. Sung <kevjsung@umich.edu>

pkgname=katago-analyze-sgf
pkgver=0.1.1
pkgrel=2

pkgdesc='Add analysis to SGF files using KataGo'
url='https://github.com/kevinsung/katago-analyze-sgf'
arch=('x86_64')
license=('MIT')

depends=('nodejs')
makedepends=('npm')

backup=('etc/conf.d/katago-analyze-sgf')

source=("$pkgname-$pkgver.tar.gz::https://github.com/kevinsung/katago-analyze-sgf/archive/refs/tags/v$pkgver.tar.gz"
        katago-analyze-sgf.conf
        katago-analyze-sgf.service
        katago-analyze-sgf.sysusers
        katago-analyze-sgf.tmpfiles)

sha256sums=('026aac1c919d6a52a01a2f5a80b200cd0b780618063ce236646dc4ddc01e9831'
            'b4225a1ecab44c28fd07ed8cd958462dbe0792b867169d14dde038288c87bf2d'
            '41d543b322ecc5b8a47b112a6c985c3c85080abd2db0d609dfeeb341fd69f69d'
            'd7d652a7e4329e777c5c5fbedad84c243ac5721e980a8adc8c10ad51fad54c0e'
            '1e3699842af258b6af3747bca815773f7b338116320d7d98ae9a304bebff439d')

build() {
  cd $pkgname-$pkgver
  npm install
  npm run build
}

package () {
  install -Dm644 katago-analyze-sgf.conf "$pkgdir"/etc/conf.d/katago-analyze-sgf
  install -Dm644 katago-analyze-sgf.service "$pkgdir"/usr/lib/systemd/system/katago-analyze-sgf.service
  install -Dm644 katago-analyze-sgf.sysusers "$pkgdir"/usr/lib/sysusers.d/katago-analyze-sgf.conf
  install -Dm644 katago-analyze-sgf.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/katago-analyze-sgf.conf

  cd $pkgname-$pkgver

  install -Dm755 katago-analyze-sgf-daemon-bundled.js "$pkgdir"/usr/bin/katago-analyze-sgf-daemon
  install -Dm755 katago-analyze-sgf-cli-bundled.js "$pkgdir"/usr/bin/katago-analyze-sgf-cli
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/katago-analyze-sgf/LICENSE
}
