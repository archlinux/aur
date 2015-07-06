# Maintainer: Josh 'jheretic' King <josh at chambana dot net>
# Contributor: James An <james@jamesan.ca>

pkgname=drush
pkgver=6.6.0
pkgrel=1
pkgdesc="The Drupal command-line shell"
arch=('any')
url="http://github.com/drush-ops/drush/"
license=('GPL')
depends=('php' 'bash')
install=${pkgname}.install
source=(
    "http://github.com/drush-ops/$pkgname/archive/$pkgver.tar.gz"
    'http://download.pear.php.net/package/Console_Table-1.1.3.tgz'
)
md5sums=('bfe556917f29e2d3c25dda8ecde96281'
         '34b5f34db1ab0c4daedf2862958af257')


package() {
    cd "${pkgname}-${pkgver}"

    # create dir structure
    install -d "${pkgdir}/etc/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${pkgname}"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    # add empty directory for drush extensions
    install -d "${pkgdir}/usr/share/${pkgname}/commands"

    # install main files
    cp -r commands classes includes "${pkgdir}/usr/lib/${pkgname}"
    cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"

    install -m644 examples/example.{{aliases.,}drushrc.php,drush.ini} "${pkgdir}/etc/${pkgname}"
    install -m644 drush_logo-black.png          "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 drush.info docs/drush.api.php "${pkgdir}/usr/lib/${pkgname}"
    install -m755 drush.php drush               "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # install Console_Table library too
    install -Dm755 ../Console_Table-1.1.3/Table.php "${pkgdir}/usr/lib/${pkgname}/includes/table.inc"
}
