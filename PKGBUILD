# Maintainer: devome <evinedeng@hotmail.com>

pkgname=php83-cli-static-bin
pkgver=8.3.24
pkgrel=4
pkgdesc="A general-purpose scripting language that is especially suited to web development (8.3.x static precompiled binary)"
arch=("x86_64" "aarch64")
url="https://www.php.net"
license=("PHP-3.01")
provides=("php83-cli")
conflicts=("php83-cli")
makedepends=("jq")
source=("php-${pkgver}-cli-build-extensions.json::https://dl.static-php.dev/static-php-cli/bulk/build-extensions.json")
source_x86_64=("php-${pkgver}-cli-linux-x86_64.tar.gz::https://dl.static-php.dev/static-php-cli/bulk/php-${pkgver}-cli-linux-x86_64.tar.gz")
source_aarch64=("php-${pkgver}-cli-linux-aarch64.tar.gz::https://dl.static-php.dev/static-php-cli/bulk/php-${pkgver}-cli-linux-aarch64.tar.gz")
sha256sums=('d53e9261993abfe9106c67a82f475d697d9fe825a5d0e18f37a88585ab5a705a')
sha256sums_x86_64=('0af4f1342588266d682bde08e634cb90ea8dfda2184674b8a732f356e97ce420')
sha256sums_aarch64=('650c9a80c54f942078cf38c243b6f93a5adcbd219ce3193325e5ae142bf3dd5d')
options=(!strip)

package() {
    provides+=( $(jq -r '.[]' "php-${pkgver}-cli-build-extensions.json" | sed -e "s|^|php83-|g" -e "s|sqlite3|sqlite|" | sort -u) )
    install -Dm755 php "${pkgdir}/usr/bin/php83" 
}
