# Maintainer: James An <james@jamesan.ca>

pkgname=php-codesniffer-drupalsecure
_pkgname=secure_cs
pkgver=r3.782f704
pkgrel=1
pkgdesc="Secure coding validation tool for Drupal built on PHP_CodeSniffer and modeled after work on DrupalCS in the Coder module"
arch=("any")
url="https://www.drupal.org/sandbox/coltrane/1921926"
license=("GPL")
depends=("php-codesniffer")
makedepends=("git")
source=("$_pkgname"::"git+https://git.drupal.org/sandbox/coltrane/1921926.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    install -d "$pkgdir/usr/share/pear/PHP/CodeSniffer/Standards"
    cp -dr --no-preserve=ownership "$_pkgname/DrupalSecure" "$pkgdir/usr/share/pear/PHP/CodeSniffer/Standards"
    install -d "$pkgdir$(dirname "$(realpath "$(which drush)")")/commands"
    cp -dr --no-preserve=ownership "$_pkgname/$_pkgname.drush.inc" "$pkgdir$(dirname "$(realpath "$(which drush)")")/commands"
}
