# Maintainer: another <code § deadcode § eu>
pkgname=openssh-known-hosts
pkgver=0.6.2
pkgrel=1
pkgdesc="known_hosts downloader/merger for OpenSSH"
arch=('any')
url="https://github.com/tiwe-de/openssh-known-hosts"
license=('GPL3')
depends=('bash' 'lockfile-progs')
optdepends=('cron: periodic execution'
			'openssh: connect to remote servers'
			'curl: retrieve known_hosts via HTTP, FTP, etc.'
			'rsync: retrieve known_hosts via rsync'
			'postgresql-client: retrieve known_hosts from PostgreSQL'
			'gnupg: verify signed files')
install=openssh-known-hosts.install
source=("https://github.com/tiwe-de/$pkgname/archive/$pkgver.tar.gz"
		"update-openssh-known-hosts.8"
		"openssh-known-hosts.cron.d")
sha256sums=('2d1cbb0c206cddf514304fb9e6a132497e1aa2e20da6eaf53ca3a02584ef9d30'
            '3b1e5b3c889ad550a233814a14461ce6bbf33e858fca55761ffb69e0c28c317e'
            'c6f1e2c22664b102710eb21aec306b6e73b3caf88e3c870b1e3ffc496d0e406d')
sha384sums=('6fc4dc33bb83fb59aa2aae78a07e7bfb54a6a47e1ba9c46d229b7247852604cb087cd7630fcb5327cf4785925c319a97'
            'a8f46b782ba3b95ee327aa5735b0f6c572019e2359847c2fbc3683facf89b583acc4f8b01db5d76ba26367ca29f5841f'
            '0c3cc0452caf6b6f85ab47d496cce53db9525cf2d406de03fda7cb59ba9c02193381b56e848ec79b93a82143cbd3aaef')
sha512sums=('90ed8bf3068590b5fab3dcfcb3e001b149660e1c4875d3fc87ba764334ac758be99b80dcbe6f8715389f374228e7d09f1de9125db5001356105dc48abf595ae0'
            '7ca4360231ea3e6b7e19aa2aac576acb112c5a6b54ed675034f1ba3de378805842478d7001da3342dd97b0d64d842576f14d3ea522a0480468d370d69b5c1f14'
            '64da7c4baa16eb9d41a143aca5a47380afc85c9faf25eb17ff5ccdbd7b02500d5dbb527cdbcd62829a729a9833a0c66977e03532f71a43e91ba8b42c61fe0a99')

package() {
	install -Dm0644 update-openssh-known-hosts.8 $pkgdir/usr/share/man/man8/update-openssh-known-hosts.8
	install -Dm0644 openssh-known-hosts.cron.d $pkgdir/etc/cron.d/$pkgname

	cd "$srcdir/${pkgname}-${pkgver}"
	install -Dm0755 update-openssh-known-hosts $pkgdir/usr/bin/update-openssh-known-hosts
	install -dm0755 $pkgdir/usr/share/$pkgname/plugins
	install -Dm0755 plugins/* $pkgdir/usr/share/$pkgname/plugins/
	install -dm0755 $pkgdir/usr/share/doc/$pkgname/examples
	install -Dm0644 examples/* $pkgdir/usr/share/doc/$pkgname/examples/
	install -Dm0644 changelog $pkgdir/usr/share/doc/$pkgname/changelog
	install -dm0755 $pkgdir/var/{lib,cache}/$pkgname $pkgdir/etc/$pkgname/sources $pkgdir/usr/local/share/$pkgname/plugins
	install -dm0755 $pkgdir/etc/ssh
}
