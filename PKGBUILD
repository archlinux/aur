# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient
pkgver=3.9.1
pkgrel=1

pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://github.com/ddclient/ddclient"
arch=('any')
license=('GPL2')

backup=('etc/ddclient/ddclient.conf')

depends=('perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-digest-sha1'
         'net-tools' 'perl-data-validate-ip')
optdepends=('smtp-forwarder: email support requires sendmail binary')

source=(https://github.com/ddclient/ddclient/archive/v$pkgver.tar.gz
        ddclient.service)

sha512sums=('a8a4d6cb94e4239a7b7b4fc7d9ebef703cbd6c45fc3394b644694a053b5b8aa8d109410b5b8b3676a5f30b18474d24c7feb16c65c30b28bd7d941d8a214b1346'
            'f2d1fe68fb6e358c15ca9bd2e2c4a8b26239607fa71ff2b9aa301a3f54d16c6858e81603e5c0638e89e3da85b7c77ebaca88d38882740a9a8a09e98b38e9b510')

package() {
  cd ddclient-$pkgver

  install -Dm755 ddclient "$pkgdir"/usr/bin/$pkgname
  install -Dm600 sample-etc_ddclient.conf "$pkgdir"/etc/ddclient/ddclient.conf
  install -d "$pkgdir"/var/cache/ddclient
  install -Dm644 "$srcdir"/ddclient.service "$pkgdir"/usr/lib/systemd/system/ddclient.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/ddclient/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/ddclient/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/ddclient/README.ssl
  install -Dm644 sample-etc_cron.d_ddclient "$pkgdir"/usr/share/doc/ddclient/sample-etc_cron.d_ddclient
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
