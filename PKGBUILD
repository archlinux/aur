# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: gato_lento <vukk.euob at gmail>
pkgname=combustion
pkgver=0.6.4
# necessary due to broken "release" process
_vercommit=e4b15ec
pkgrel=1
pkgdesc='Sleek, modern web interface for Transmission'
arch=('any')
url='https://github.com/Secretmapper/combustion'
license=('MIT')
depends=('transmission-cli')
makedepends=('git')

source=("${pkgname}::git+${url}#commit=${_vercommit}"
        combustion.sh
        combustion.conf)

sha256sums=('SKIP'
            '3d19c6507db71262cf8757e10c0b692f5386d78314ea2b2cdd569d6d0ebbf90e'
            '32d85f5b3b842f88fe573d1af3e20727797b75d53db0e70b68c4e521a9f8e339')

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 "$srcdir/combustion.sh" "$pkgdir/etc/profile.d/combustion.sh"
  install -D -m644 "$srcdir/combustion.conf" "$pkgdir/usr/lib/systemd/system/transmission.service.d/combustion.conf"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/$pkgname" asset-manifest.json favicon.ico index.html main.77f9cffc.css
  cp -r static "$pkgdir/usr/share/$pkgname"
}
