# Maintainer: Denton Liu <liu.denton@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient-git
_gitname="${pkgname%-git}"
pkgver=v3.8.3.r104.gec2acfb
pkgrel=1

pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://github.com/ddclient/ddclient/"
arch=('any')
license=('GPL2')
provides=("$_gitname")
conflicts=("$_gitname")

backup=('etc/ddclient/ddclient.conf')

makedepends=('git')
depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools' 'perl-data-validate-ip')
optdepends=('perl-json-any: needed for cloudflare module')

source=(git+https://github.com/ddclient/ddclient.git
        ddclient.service)

sha256sums=('SKIP'
            '0f2f66359de844ca2a0c99f0189879ca1c6b5924f8e07e33cc226680540fa62d')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_gitname"

  install -Dm755 $_gitname "$pkgdir"/usr/bin/$_gitname
  install -Dm600 sample-etc_$_gitname.conf "$pkgdir"/etc/$_gitname/$_gitname.conf
  install -d "$pkgdir"/var/cache/$_gitname
  install -Dm644 "$srcdir"/$_gitname.service "$pkgdir"/usr/lib/systemd/system/$_gitname.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/$_gitname/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_gitname/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/$_gitname/README.ssl
  install -Dm644 sample-etc_cron.d_$_gitname "$pkgdir"/usr/share/doc/$_gitname/sample-etc_cron.d_$_gitname
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_gitname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$_gitname/COPYRIGHT
}
