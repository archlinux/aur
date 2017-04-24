# Maintainer: gato_lento <vukk.euob at gmail>
pkgname=combustion
pkgver=0.6.2
pkgrel=1
pkgdesc='Sleek, modern web interface for Transmission'
arch=('any')
url='https://github.com/Secretmapper/combustion'
license=('MIT')
depends=('transmission-cli')
makedepends=('git')

source=(
  "git+https://github.com/Secretmapper/combustion.git"
  "combustion.sh"
  "combustion.conf"
)

sha1sums=(
  SKIP
  1b2e73e143508792e94bd7d35f2e0d68b837527a
  449f682b9c6cb896d0650104c45bbdc07afcfece
)

package() {
  install -D -m644 "$srcdir/combustion/LICENSE" "$pkgdir/usr/share/licenses/combustion/LICENSE"
  install -D -m755 "$srcdir/combustion.sh" "$pkgdir/etc/profile.d/combustion.sh"
  install -D -m644 "$srcdir/combustion.conf" "$pkgdir/usr/lib/systemd/system/transmission.service.d/combustion.conf"
  cd "$srcdir/combustion"
  git checkout v${pkgver}
  cp -r "$srcdir/combustion" "$pkgdir/usr/share/"
  rm -rf "$pkgdir/usr/share/combustion/.git"
}
