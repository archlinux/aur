pkgname=slidge-whatsapp
pkgver=0.3.10
pkgrel=1
pkgdesc="A feature-rich Telegram to XMPP puppeteering gateway, based on slidge and Pyrofork."
arch=('any')
url="https://codeberg.org/slidge/slidge-whatsapp"
license=('AGPL-3.0-or-later')
depends=('python')
makedepends=(
    'python-pip'
    'python-setuptools'
)
backup=('etc/slidge-whatsapp.ini')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/slidge/slidge-whatsapp/archive/v$pkgver.tar.gz"
	"https://codeberg.org/slidge/slidge/raw/tag/v$pkgver/dev/confs/slidge-example.ini"
	"slidge-whatsapp.service")
md5sums=('2ea79960f18933c0b23b9bb4ee7613cd'
         'd44db4d0f3adc01f2fd43db7cbed1d40'
         'b20edb817bc9d59e5b91fb87a3e978b1')

package() {
  cd "$srcdir/$pkgname"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir"/opt/slidge-whatsapp --ignore-installed \
        "slidge-whatsapp==$pkgver"
  install -Dm0644 "$srcdir"/slidge-example.ini "$pkgdir"/etc/slidge-whatsapp.ini
  install -Dm0644 "$srcdir"/slidge-whatsapp.service "$pkgdir"/usr/lib/systemd/system/slidge-whatsapp.service
}
