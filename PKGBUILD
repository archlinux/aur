pkgname=slidgram
pkgver=0.3.1
pkgrel=1
pkgdesc="A feature-rich Telegram to XMPP puppeteering gateway, based on slidge and Pyrofork."
arch=('any')
url="https://codeberg.org/slidge/slidgram"
license=('AGPL-3.0-or-later')
depends=('python')
backup=('etc/slidgram.ini')
makedepends=(
    'python-pip'
    'python-setuptools'
)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/slidge/slidgram/archive/v$pkgver.tar.gz"
	"https://codeberg.org/slidge/slidge/raw/tag/v$pkgver/dev/confs/slidge-example.ini"
	"slidgram.service")
md5sums=('cf71d151b8296790bb7d9f8edaf4aa17'
         'd44db4d0f3adc01f2fd43db7cbed1d40'
         'dca29fcd84011b5c5b8ddf6ff421b827')

package() {
  cd "$srcdir/$pkgname"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir"/opt/slidgram --ignore-installed \
        "slidgram==$pkgver"
  install -Dm0644 "$srcdir"/slidge-example.ini "$pkgdir"/etc/slidgram.ini
  install -Dm0644 "$srcdir"/slidgram.service "$pkgdir"/usr/lib/systemd/system/slidgram.service
}
