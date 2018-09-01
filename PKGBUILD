# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Scott Dickson <scottfoesho@gmail.com>

pkgname=cops
pkgver=1.1.2
pkgrel=1
pkgdesc='Calibre OPDS (and HTML) PHP Server : web-based light alternative to Calibre content server / Calibre2OPDS to serve ebooks'
arch=('any')
url="https://github.com/seblucas/$pkgname"
license=('GPL2')
depends=('php' 'php-gd' 'php-intl' 'php-sqlite')
optdepends=('apache: Web server to run COPS'
            'nginx: Web server to run COPS'
	        'cherokee: Web server to run COPS')
makedepends=('composer')
backup=("etc/webapps/$pkgname/config_local.php")
install="$pkgname.install"
source=("https://github.com/seblucas/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c1964310a50a532a8fd745d2a4ed82bfbf74745997be31c43a049ba5b8f54b08')

prepare () {
    cd "$pkgname-$pkgver"
    composer update --no-dev
}

build () {
    cd "$pkgname-$pkgver"
    composer install --no-dev --optimize-autoloader
}

package () {
    cd "$pkgname-$pkgver"
    install -Dm0644 config_local.php.example "$pkgdir/etc/webapps/cops/config_local.php"
    install -d "$pkgdir/usr/share/webapps"
    cp -r ./ "$pkgdir/usr/share/webapps/cops"
    ln -s "/etc/webapps/cops/config_local.php" "$pkgdir/usr/share/webapps/cops/"
    ln -s "/etc/webapps/cops/metadata.db" "$pkgdir/usr/share/webapps/cops/"
}
