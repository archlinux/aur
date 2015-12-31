# Maintainer: sinkuu <sinkuupump@gmail.com>

_install_cron_file=

pkgname=clamav-unofficial-sigs
pkgver=4.9.2
pkgrel=2
pkgdesc='ClamAV Unofficial Signatures Updater maintained by eXtremeSHOK.com'
arch=('any')
url='https://github.com/extremeshok/clamav-unofficial-sigs'
license=('BSD')
depends=('clamav' 'rsync' 'bind-tools' 'gnupg' 'curl')
source=("https://github.com/extremeshok/clamav-unofficial-sigs/archive/$pkgver.tar.gz"
	'clamav-unofficial-sigs.conf.patch'
	'clamav-unofficial-sigs-logrotate.patch')
md5sums=('28e8aa5bc8618b577228d58e83f27814'
         '8f04cbf6af233ce313ec1e773bb1e1c7'
         'ac3d217191df0720487279246eaeff5c')
sha256sums=('70e05f63add7e03d5af2dba6bcd31fda98646577798d99e6902e5f264c302e93'
            '6dcf94c34df7d5c321dd9ee7bedfd9262a6f32533d4f5786c1c0b6c4ebb7c7e4'
            '9a49e67a615d462917d605e5924bccfbe8c0e646e93d5cfc4faa2dd2d853c8d1')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/clamav-unofficial-sigs.conf.patch"
	patch -p1 -i "$srcdir/clamav-unofficial-sigs-logrotate.patch"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 clamav-unofficial-sigs.sh ${pkgdir}/usr/bin/clamav-unofficial-sigs.sh
	install -Dm644 clamav-unofficial-sigs.conf ${pkgdir}/etc/clamav-unofficial-sigs.conf
	install -Dm644 clamav-unofficial-sigs.8 ${pkgdir}/usr/share/man/man8/clamav-unofficial-sigs.8
	install -Dm644 clamav-unofficial-sigs-logrotate ${pkgdir}/etc/logrotate.d/clamav-unofficial-sigs-logrotate
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/clamav-unofficial-sigs/LICENSE

	if [ -n "$_install_cron_file" ]; then
		install -Dm644 clamav-unofficial-sigs-cron \
			${pkgdir}/etc/cron.d/clamav-unofficial-sigs-cron
	fi
}
