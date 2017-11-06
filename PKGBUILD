# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=esniper-web
pkgver=r24.a0c7707
pkgrel=1
pkgdesc="Web UI of esniper for sniping eBay auctions."
arch=('any')
url="https://github.com/yhfudev/esniper-web.git"
license=('BSD')
depends=('curl' 'openssl')
source=(
    "${pkgname}::git+https://github.com/yhfudev/esniper-web.git"
    "esniperweb.install"
    "setdb.sh"
  )
sha256sums=('SKIP'
            '18acf73a198a52223c4069e7e06c897ccf9142420d9189e7a5b9f026c5b584f2'
            '1129077445c9b823ce2428c43c9d39b56553cea5e423cffc59b47726e401bfcb'
    )

install=esniperweb.install

depends=('php' 'php-fpm' 'php-gd')
optdepends=('nginx: Web server for serving Wordpress'
          'apache: Web server for serving Wordpress'
          'mariadb: Database server')

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    #echo ${ver:0:7}
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver() {
    pkgver_git
}

package()
{
  #cd "${srcdir}/${pkgname}"

  install -d "$pkgdir/usr/share"
  install -d "$pkgdir/usr/share/webapps"

  cp -r "${srcdir}/${pkgname}" "$pkgdir/usr/share/webapps/esniper"
  rm -rf "$pkgdir/usr/share/webapps/esniper/.git/"
  cp setdb.sh "$pkgdir/usr/share/webapps/esniper/install/"
  chown http:http -R "$pkgdir/usr/share/webapps/esniper"
}

# vim: ts=2 sw=2 et:

