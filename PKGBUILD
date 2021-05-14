# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=user_saml
pkgname=nextcloud-app-${_appname/_/-}
pkgver=4.1.0
pkgrel=1
pkgdesc="App for authenticating Nextcloud users using SAML"
arch=(x86_64)
url="https://github.com/nextcloud/$_appname"
license=(AGPL3)
depends=(nextcloud)
makedepends=(composer)
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c36e136995e3598fc274b4685e1bac681634d29c1995a762ccce7cda4360ee90')

prepare() {
	cd "$_appname-$pkgver"
	composer install --no-dev -d ./3rdparty/
}

package() {
    cd "$_appname-$pkgver"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		--exclude=.drone.yml \
		--exclude=.git \
		--exclude=.gitattributes \
		--exclude=.github \
		--exclude=.gitignore \
		--exclude=.scrutinizer.yml \
		--exclude=.travis.yml \
		--exclude=.tx \
		--exclude=/build \
		--exclude=/CONTRIBUTING.md \
		--exclude=/docs \
		--exclude=/issue_template.md \
		--exclude=/l10n/l10n.pl \
		--exclude=/Makefile \
		--exclude=/README.md \
		--exclude=/screenshots \
		--exclude=/tests \
		--exclude=/translationfiles \
	./ $_appdir/
}
